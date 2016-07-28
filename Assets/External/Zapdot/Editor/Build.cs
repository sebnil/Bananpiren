using UnityEngine;
using UnityEditor;
using System;
using System.IO;
using System.Collections.Generic;
using System.Reflection;
using Debug = UnityEngine.Debug;

/* Notes:
 * 
 * All builds will be created with a preprocessor define based on their StoreType.
 * - For instance, Mac App Store builds will have STORE_MAC defined.
 */ 

public class Build : MonoBehaviour
{
    protected enum StoreType
    {
        None,
        MacAppStore,
        AppStore,
        GooglePlay,
        Steam
    }

    private static string[] scenes = new string[] { 
                                                    "Assets/Scenes/MainScene.unity", 
                                                  };

    //private static BuildOptions devBuildOptions = BuildOptions.Development | BuildOptions.ShowBuiltPlayer;
    private static BuildOptions prodBuildOptions = BuildOptions.None | BuildOptions.ShowBuiltPlayer;

    protected static void RunBuild(BuildTarget target, BuildOptions options, StoreType store)
    {
        ClearLog();

        AppInfo.CheckForDefaults();

        string buildLocation = GetBuildDirectory(target, store);
        string buildFile = GetBuildFile(target);

        Debug.Log(string.Format("[BUILD] [{0} : {1}] Started @ {2:MM/dd/yy hh:mm:ss}", store.ToString(), target.ToString(), DateTime.Now));

        BuildCreateFolder(buildLocation, buildFile, target);

        BuildUnityProject(target, options, store, buildLocation, buildFile);

        BuildCopyIncludes(target, store);

        BuildZip(buildLocation, buildFile, target, store);

        Debug.Log(string.Format("[BUILD] [{0} : {1}] Completed @ {2:MM/dd/yy hh:mm:ss}.", store.ToString(), target.ToString(), DateTime.Now));
    }

    private static void BuildCreateFolder(string buildLocation, string buildFile, BuildTarget target)
    {
        DirectoryInfo dirBuild = new DirectoryInfo(buildLocation);

        // if the directory exists, delete it.
        if (dirBuild.Exists)
        {
            Debug.Log("[BUILD] Cleaning Directory.");

            FileTools.MakeFilesWritable(dirBuild);

            if (target == BuildTarget.Android)
            {
                if (File.Exists(buildFile))
                    File.Delete(buildFile);
            }
            else
            {
                Directory.Delete(buildLocation, true);
            }
        }

        dirBuild.Create();
        Debug.Log("[BUILD] Created: " + Path.GetFullPath(buildLocation));
    }

    private static void BuildUnityProject(BuildTarget target, BuildOptions options, StoreType store, string buildLocation, string buildFile)
    {
        PlayerSettings.companyName = AppInfo.companyName;
        PlayerSettings.productName = AppInfo.longName;

        PlayerSettings.bundleIdentifier = AppInfo.appleBundleId;
        PlayerSettings.bundleVersion = AppInfo.fullVersion;

        List<string> buildScenes = new List<string>(scenes);

        // if you need to define multiple symbols, separate them with a semicolon (;)
        string defineSymbols = "STORE_" + store.ToString().ToUpper();

        // generally want player logs enabled in case something weird happens and we can get some 
        // info from it. just don't be stupid with logging debug stuff on release.
        PlayerSettings.usePlayerLog = true;

        // platform specific options
        if (target == BuildTarget.Android)
        {
            PlayerSettings.defaultInterfaceOrientation = UIOrientation.LandscapeRight;
            PlayerSettings.Android.minSdkVersion = AndroidSdkVersions.AndroidApiLevel9;

            //PlayerSettings.Android.keystorePass = "";
            //PlayerSettings.Android.keyaliasName = "";
            //PlayerSettings.Android.keyaliasPass = "";

            // ensure the versioncode increases by 1, for Google Play, this is important if you're building 
            // multiple APKs per release.
            PlayerSettings.Android.bundleVersionCode += 1;

            PlayerSettings.SetScriptingDefineSymbolsForGroup(BuildTargetGroup.Android, defineSymbols);
        }
        else if (target.ToString().Contains("Standalone"))
        {
            PlayerSettings.useMacAppStoreValidation = false;

            PlayerSettings.SetScriptingDefineSymbolsForGroup(BuildTargetGroup.Standalone, defineSymbols);
        }
        else if (target == BuildTarget.iOS)
        {
            PlayerSettings.SetScriptingDefineSymbolsForGroup(BuildTargetGroup.iOS, defineSymbols);
        }

        // store-specific options
        if (store == StoreType.MacAppStore)
        {
            // Mac App Store is very picky about where applications can write to, and I've been told that people
            // have failed certification when they left usePlayerLog on. Since dealing with all of the permissions
            // and whatnot on MAS is enough of a pain, I'm going to trust them and disable it. 
            PlayerSettings.useMacAppStoreValidation = true;
            PlayerSettings.usePlayerLog = false;
        }

        string buildResult = BuildPipeline.BuildPlayer(buildScenes.ToArray(), buildLocation + buildFile, target, options);

        // error logs
        if (!string.IsNullOrEmpty(buildResult))
        {
            Debug.LogError(buildResult);
        }
        else
        {
            Debug.Log("[BUILD] Unity Build Successful.");
        }
    }

    // copy everything in the BuildIncludes directory over into the proper directories, overwriting files if they already exist.
    private static void BuildCopyIncludes(BuildTarget target, StoreType store)
    {
        string buildLocation = GetBuildDirectory(target, store);
        string buildIncludeLocation = GetBuildIncludesDirectory(target, store);
        
        if (Directory.Exists(buildIncludeLocation))
            FileTools.CopyAll(buildIncludeLocation, buildLocation);
    }

    private static void BuildZip(string buildLocation, string buildFile, BuildTarget target, StoreType store)
    {
        string zipBuildDestination = GetBuildStoreDirectory(store);

        // we don't zip up APKs, because simply posting them to the web allows devices to install them from a link.
        // so for android, we simply copy the file to a versioned name.
        if (target == BuildTarget.Android)
        {
            string versionedName = string.Format("{0}.{1}_{2}.apk", buildFile.Substring(0, buildFile.Length - 4), AppInfo.buildDate, AppInfo.buildCount);

            FileTools.CopyTo(buildLocation + buildFile, zipBuildDestination + versionedName);
        }
        else
        {
            string zipFile = string.Format("{0}.{1}_{2}.zip", target.ToString().Replace("Standalone", ""), AppInfo.buildDate, AppInfo.buildCount);

            FileTools.ZipDirectory(buildLocation, zipBuildDestination, zipFile);
        }
    }

    protected static void PushToDropbox(StoreType store)
    {
        string storePath = GetBuildStoreDirectory(store);
		string dbBasePath = FileTools.GetDropboxPath();
        string dbStoreFolder = store == StoreType.None ? "NoStore" : store.ToString();
        string dbPath = string.Format("{0}/GameBuilds/{1}/{2}/", dbBasePath, AppInfo.shortName, dbStoreFolder);
        string dbArchivePath = dbPath + "Archive/";
        
		if (!Directory.Exists(dbBasePath))
		{
			Debug.LogError("[ERROR] Dropbox path doesn't exist.");
			return;
		}

        int archiveCount = 0;
        int buildFileCount = 0;

        if (!Directory.Exists(dbPath))
            Directory.CreateDirectory(dbPath);

        if (!Directory.Exists(dbArchivePath))
            Directory.CreateDirectory(dbArchivePath);

        // now we want to move all zips and apks to our dropbox folder.
        string[] extensions = new string[] { "*.zip", "*.apk" };

        foreach (string ext in extensions)
        {
            // move all current build zips to our build folder
            string[] buildFiles = Directory.GetFiles(storePath, ext, SearchOption.TopDirectoryOnly);

            buildFileCount += buildFiles.Length;

            foreach (string file in buildFiles)
            {
                string filename = Path.GetFileName(file);
                string extension = Path.GetExtension(filename);
                int endIndex = filename.LastIndexOf(".", filename.Length - extension.Length - 1);
                string prefix = filename.Substring(0, endIndex); // remove .YYMMDD_V.XXX

                // move all current build files to our archive folder.
                string[] dbFiles = Directory.GetFiles(dbPath, prefix + "*", SearchOption.TopDirectoryOnly);

                foreach (string dbFile in dbFiles)
                {
                    string destFile = dbArchivePath + Path.GetFileName(dbFile);

                    if (File.Exists(destFile))
                        File.Delete(destFile);

                    File.Move(dbFile, destFile);
                    ++archiveCount;
                }

                File.Move(file, dbPath + Path.GetFileName(file));
            }
        }

        Debug.Log(string.Format("[BUILD] {0} file(s) copied to Dropbox. ({1} file(s) archived.)", buildFileCount, archiveCount));
    }

    private static string GetBuildStoreDirectory(StoreType store)
    {
        string buildLocation = Path.GetFullPath(Application.dataPath + "/../../Builds/");

        if (store != StoreType.None)
        {
            buildLocation += string.Format("{0}/", store.ToString());
        }
        else
        {
            buildLocation += "NoStore/";
        }

        return Path.GetFullPath(buildLocation);
    }

    private static string GetBuildDirectory(BuildTarget target, StoreType store)
    {
        string buildLocation = GetBuildStoreDirectory(store);

        if (target == BuildTarget.StandaloneWindows)
        {
            buildLocation += "Windows/";
        }
        else if (target == BuildTarget.StandaloneOSXIntel)
        {
            buildLocation += "Mac/";
        }
        else if (target == BuildTarget.StandaloneLinux)
        {
            buildLocation += "Linux/";
        }
        else if (target == BuildTarget.iOS)
        {
            buildLocation += "iOS/";
        }
        else if (target == BuildTarget.Android)
        {
            buildLocation += "Android/";
        }

        return Path.GetFullPath(buildLocation);
    }

    private static string GetBuildIncludesDirectory(BuildTarget target, StoreType store)
    {
        string buildLocation = Path.GetFullPath(Application.dataPath + "/../../BuildIncludes/");

        if (store != StoreType.None)
        {
            buildLocation += string.Format("{0}/", store.ToString());
        }
		else
		{
			buildLocation += "NoStore/";
		}

        if (target == BuildTarget.StandaloneWindows)
        {
            buildLocation += "Windows/";
        }
        else if (target == BuildTarget.StandaloneOSXIntel)
        {
            buildLocation += "Mac/";
        }
        else if (target == BuildTarget.StandaloneLinux)
        {
            buildLocation += "Linux/";
        }
        else if (target == BuildTarget.iOS)
        {
            buildLocation += "iOS/";
        }
        else if (target == BuildTarget.Android)
        {
            buildLocation += "Android/";
        }

        return buildLocation;
    }

    private static string GetBuildFile(BuildTarget target)
    {
        string buildFile = AppInfo.shortName;

        if (target == BuildTarget.StandaloneWindows)
        {
            buildFile += ".exe";
        }
        else if (target == BuildTarget.StandaloneOSXIntel)
        {
            buildFile += ".app";
        }
        else if (target == BuildTarget.StandaloneLinux)
        {
            buildFile += ".x86";
        }
        else if (target == BuildTarget.iOS)
        {
            buildFile += ".app";
        }
        else if (target == BuildTarget.Android)
        {
            buildFile += "." + EditorUserBuildSettings.androidBuildSubtarget.ToString();
            buildFile += ".apk";
        }

        return buildFile;
    }

    public static void ClearLog()
    {
        Assembly assembly = Assembly.GetAssembly(typeof(SceneView));

        Type type = assembly.GetType("UnityEditorInternal.LogEntries");
        MethodInfo method = type.GetMethod("Clear");
        method.Invoke(new object(), null);
    }

    //[MenuItem("Tools/Build/Test")]
    //private static void Test()
    //{
    //}

    // ========================================================================
    //  MENU: NO STORE
    // ========================================================================

    [MenuItem("Tools/Build/NoStore/All Platforms", false, 0)]
    protected static void RunNoStoreAllProdBuild()
    {
        AppInfo.IncrementBuildNumber();

        RunBuild(BuildTarget.StandaloneWindows, prodBuildOptions, StoreType.None);
        RunBuild(BuildTarget.StandaloneOSXIntel, prodBuildOptions, StoreType.None);
        RunBuild(BuildTarget.StandaloneLinux, prodBuildOptions, StoreType.None);

        RunNoStoreAndroidProdBuild(MobileTextureSubtarget.ETC);
        RunNoStoreAndroidProdBuild(MobileTextureSubtarget.ATC);
        RunNoStoreAndroidProdBuild(MobileTextureSubtarget.DXT);
        RunNoStoreAndroidProdBuild(MobileTextureSubtarget.PVRTC);
    }

    [MenuItem("Tools/Build/NoStore/PC/All", false, 100)]
    protected static void RunNoStoreAllPCProdBuild()
    {
        AppInfo.IncrementBuildNumber();

        RunBuild(BuildTarget.StandaloneWindows, prodBuildOptions, StoreType.None);
        RunBuild(BuildTarget.StandaloneOSXIntel, prodBuildOptions, StoreType.None);
        RunBuild(BuildTarget.StandaloneLinux, prodBuildOptions, StoreType.None);
    }

    [MenuItem("Tools/Build/NoStore/PC/Windows", false, 101)]
    protected static void RunNoStoreWindowsProdBuild()
    {
        AppInfo.IncrementBuildNumber();

        RunBuild(BuildTarget.StandaloneWindows, prodBuildOptions, StoreType.None);
    }

    [MenuItem("Tools/Build/NoStore/PC/Mac", false, 102)]
    protected static void RunNoStoreMacProdBuild()
    {
        AppInfo.IncrementBuildNumber();

        RunBuild(BuildTarget.StandaloneOSXIntel, prodBuildOptions, StoreType.None);
    }

    [MenuItem("Tools/Build/NoStore/PC/Linux", false, 103)]
    protected static void RunNoStoreLinuxProdBuild()
    {
        AppInfo.IncrementBuildNumber();

        RunBuild(BuildTarget.StandaloneLinux, prodBuildOptions, StoreType.None);
    }

    [MenuItem("Tools/Build/NoStore/Android/All", false, 110)]
    protected static void RunNoStoreAndroidProdBuildAll()
    {
        AppInfo.IncrementBuildNumber();

        RunNoStoreAndroidProdBuild(MobileTextureSubtarget.ETC);
        RunNoStoreAndroidProdBuild(MobileTextureSubtarget.ATC);
        RunNoStoreAndroidProdBuild(MobileTextureSubtarget.DXT);
        RunNoStoreAndroidProdBuild(MobileTextureSubtarget.PVRTC);
    }

    [MenuItem("Tools/Build/NoStore/Android/ATC", false, 111)]
    protected static void RunNoStoreAndroidProdBuildATC()
    {
        AppInfo.IncrementBuildNumber();

        RunNoStoreAndroidProdBuild(MobileTextureSubtarget.ATC);
    }

    [MenuItem("Tools/Build/NoStore/Android/DXT", false, 112)]
    protected static void RunNoStoreAndroidProdBuildDXT()
    {
        AppInfo.IncrementBuildNumber();

        RunNoStoreAndroidProdBuild(MobileTextureSubtarget.DXT);
    }

    [MenuItem("Tools/Build/NoStore/Android/PVRTC", false, 113)]
    protected static void RunNoStoreAndroidProdBuildPVRTC()
    {
        AppInfo.IncrementBuildNumber();

        RunNoStoreAndroidProdBuild(MobileTextureSubtarget.PVRTC);
    }

    [MenuItem("Tools/Build/NoStore/Android/ETC", false, 114)]
    protected static void RunNoStoreAndroidProdBuildETC()
    {
        AppInfo.IncrementBuildNumber();

        RunNoStoreAndroidProdBuild(MobileTextureSubtarget.ETC);
    }

    [MenuItem("Tools/Build/NoStore/Push To Dropbox", false, 500)]
    protected static void PushNoStoreToDropbox()
    {
        PushToDropbox(StoreType.None);
    }

    protected static void RunNoStoreAndroidProdBuild(MobileTextureSubtarget textureCompression)
    {
        EditorUserBuildSettings.androidBuildSubtarget = textureCompression;

        RunBuild(BuildTarget.Android, prodBuildOptions, StoreType.None);
    }
}
