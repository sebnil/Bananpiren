#if UNITY_EDITOR
using UnityEditor;
#endif

using UnityEngine;
using Debug = UnityEngine.Debug;
using System.Collections;
using System.Diagnostics;
using System.IO;

public static class AppInfo
{
    static AppInfo()
    {
        CheckForDefaults();
    }

    /// <summary>
    /// The name of the company.
    /// </summary>
    public static string companyName
    {
        get { return "Treplex"; }
    }

    /// <summary>
    /// Full name of the game, including spaces and punctuation.
    /// </summary>
    public static string longName
    {
        get { return "Shipper"; }
    }

    /// <summary>
    /// Short name of the game, no spaces.
    /// </summary>
    public static string shortName
    {
        get { return "shipper"; }
    }

    /// <summary>
    /// Major Version Number
    /// </summary>
    public static string majorVersion
    {
        get { return "0"; }
    }

    /// <summary>
    /// Minor Version Number
    /// </summary>
    public static string minorVersion
    {
        get { return "9"; }
    }

    /// <summary>
    /// Build Date
    /// </summary>
    private static string _buildDate;
    public static string buildDate
    {
        get 
        {
            if (!updatedFromFile)
                UpdateFromFile();

            return _buildDate;
        }

        private set
        {
            _buildDate = value;
        }
    }

    /// <summary>
    /// Build Version
    /// </summary>
    private static int _buildCount;
    public static int buildCount
    {
        get
        {
            if (!updatedFromFile)
                UpdateFromFile();

            return _buildCount;
        }

        private set
        {
            _buildCount = value;
        }
    }

    /// <summary>
    /// The base version identifier, including major and minor version. 
    /// </summary>
    public static string baseVersion
    {
        get { return string.Format("v{0}.{1}", AppInfo.majorVersion, AppInfo.minorVersion); }
    }

    /// <summary>
    /// The full version identifier, including major and minor version, as well as the build date and build count for that date. 
    /// </summary>
    public static string fullVersion
    {
        get { return string.Format("{0}.{1}.{2}", AppInfo.baseVersion, AppInfo.buildDate, AppInfo.buildCount); }
    }

    /// <summary>
    /// The Apple Application Identifier    
    /// </summary>
    public static string appleAppId
    {
        get { return "0123456789"; }
    }

    /// <summary>
    /// The Apple Bundle Identifier.
    /// </summary>
    public static string appleBundleId
    {
        get { return "com.zapdot." + shortName; }
    }

    /// <summary>
    /// The Steam Application Identifier.
    /// </summary>
    public static string steamAppId
    {
        get { return "9876543210"; }
    }

    private static bool updatedFromFile = false;

    private static string currentDateString
    {
        get { return string.Format("{0:yyMMdd}", System.DateTime.Now); }
    }

    private static string buildInfoPath
    {
        get
        {
#if UNITY_EDITOR
            return Path.GetFullPath(Application.dataPath + "/Resources/AppInfo/build_info.txt");
#else
            return string.Empty;
#endif
        }
    }

    public static void IncrementBuildNumber()
    {
#if UNITY_EDITOR
        UpdateFromFile();

        if (buildDate != currentDateString)
        {
            buildDate = currentDateString;
            buildCount = 1;
        }
        else
            ++buildCount;

        WriteToInfoFile(buildDate, buildCount);
#endif
    }

    private static void UpdateFromFile()
    {
        if (!File.Exists(buildInfoPath))
        {
			AppInfo.buildDate = "000000";
			AppInfo.buildCount = 0;
        }
        else
        {
			TextAsset buildInfoData = Resources.Load("AppInfo/build_info") as TextAsset;
			string infoText = buildInfoData.text;
			
			string[] buildData = infoText.Split(',');
			
			if (buildData.Length == 2)
			{
				if (!string.IsNullOrEmpty(buildData[0]))
					AppInfo.buildDate = buildData[0];
				
				if (!string.IsNullOrEmpty(buildData[1]))
					AppInfo.buildCount = int.Parse(buildData[1]);
			}
        }

        updatedFromFile = true;
    }

    private static void WriteToInfoFile(string date, int count)
    {
#if UNITY_EDITOR
		DirectoryInfo buildInfoDir = new DirectoryInfo(Path.GetDirectoryName(buildInfoPath));
		if (!buildInfoDir.Exists)
			buildInfoDir.Create();

        FileInfo buildInfoFile = new FileInfo(buildInfoPath);
		if (buildInfoFile.Exists)
			buildInfoFile.IsReadOnly = false;

        File.WriteAllText(buildInfoPath, string.Format("{0},{1}", date, count));

        AssetDatabase.Refresh(ImportAssetOptions.ForceSynchronousImport);
#endif
    }

    public static void CheckForDefaults()
    {
        if (longName == "GAMENAME")
            Debug.LogError("[APPINFO] Defaults Still Set.");
    }
}
