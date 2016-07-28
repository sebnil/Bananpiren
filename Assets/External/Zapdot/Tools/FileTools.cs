using UnityEngine;
using Debug = UnityEngine.Debug;

using System;
using System.IO;
using System.Collections.Generic;
using System.Diagnostics;

public static class FileTools
{
    public static string CleanFilename(string filename)
    {
        foreach (char badChar in Path.GetInvalidFileNameChars())
            filename = filename.Replace(badChar.ToString(), string.Empty);

        return filename;
    }

    public static string CleanPath(string path)
    {
        foreach (char badChar in Path.GetInvalidPathChars())
            path = path.Replace(badChar.ToString(), string.Empty);

        return path;
    }

    public static string CleanPathAndFilename(string path)
    {
        return CleanPath(CleanFilename(path));
    }

    public static void CopyTo(string sourceFilePath, string targetFilePath)
    {
        string targetDir = Path.GetDirectoryName(targetFilePath);

        if (!File.Exists(sourceFilePath))
            return;

        if (!Directory.Exists(targetDir))
            Directory.CreateDirectory(targetDir);

        FileInfo targetFile = new FileInfo(targetFilePath);
        if (targetFile.Exists)
            targetFile.IsReadOnly = false;

        File.Copy(sourceFilePath, targetFilePath, true);
    }

    public static void CopyAll(string sourcePath, string targetPath)
    {
        CopyAll(new DirectoryInfo(sourcePath), new DirectoryInfo(targetPath));
    }

    public static void CopyAll(DirectoryInfo source, DirectoryInfo target)
    {
        if (source.FullName.ToLower() == target.FullName.ToLower())
            return;

        if (!Directory.Exists(target.FullName))
            Directory.CreateDirectory(target.FullName);

        foreach (FileInfo fileInfo in source.GetFiles())
            fileInfo.CopyTo(Path.Combine(target.FullName, fileInfo.Name), true);

        foreach (DirectoryInfo diSourceSubDir in source.GetDirectories())
        {
            DirectoryInfo nextTargetSubDir = target.CreateSubdirectory(diSourceSubDir.Name);
            CopyAll(diSourceSubDir, nextTargetSubDir);
        }
    }

    public static void DeleteFilesByPattern(string path, string pattern)
    {
        DeleteFilesByPattern(new DirectoryInfo(path), pattern);
    }

    public static void DeleteFilesByPattern(DirectoryInfo dir, string pattern)
    {
        FileInfo[] patternFiles = dir.GetFiles(pattern, SearchOption.AllDirectories);

        foreach (FileInfo file in patternFiles)
            file.Delete();
    }

    public static void CleanDirectory(DirectoryInfo dir)
    {
        CleanDirectory(dir, SearchOption.TopDirectoryOnly, string.Empty);
    }

    public static void CleanDirectory(DirectoryInfo dir, SearchOption depth)
    {
        CleanDirectory(dir, depth, string.Empty);
    }

    public static void CleanDirectory(DirectoryInfo dir, SearchOption depth, string keepExtension)
    {
        List<string> extensions = null;

        if (!string.IsNullOrEmpty(keepExtension))
        {
            extensions = new List<string>();
            extensions.Add(keepExtension);
        }

        CleanDirectory(dir, depth, extensions);
    }

    public static void CleanDirectory(DirectoryInfo dir, SearchOption depth, List<string> keepExtensions)
    {
        FileInfo[] files = dir.GetFiles("*", depth);

        foreach (FileInfo file in files)
        {
            bool deleteFile = true;

            if (keepExtensions != null)
            {
                for (int i = 0; i < keepExtensions.Count; ++i)
                {
                    if (file.Name.EndsWith(keepExtensions[i]))
                    {
                        deleteFile = false;
                        break;
                    }
                }
            }

            if (deleteFile)
                file.Delete();
        }
    }

    public static void ZipDirectory(string pathToZip, string pathDestination, string filename)
    {
        ZipDirectory(pathToZip, pathDestination, filename, string.Empty);
    }

    public static void ZipDirectory(string pathToZip, string pathDestination, string filename, string password)
    {
        string fullDestPath = Path.Combine(pathDestination, filename);

        if (File.Exists(fullDestPath))
            File.Delete(fullDestPath);

        string fullArgs = string.Empty;

        Process zip = new Process();

        if (Application.platform == RuntimePlatform.WindowsEditor)
        {
            string dirTo7Zip = Path.GetFullPath(Application.dataPath + "/../../BuildTools/7zip/");

            if (!Directory.Exists(dirTo7Zip))
            {
                Debug.LogError("[ERROR] 7Zip not found in: " + dirTo7Zip);
                return;
            }

            pathToZip = Path.GetFullPath(pathToZip + "\\*");

            if (string.IsNullOrEmpty(password))
                fullArgs = string.Format("a -tzip -r -y \"{0}\" \"{1}\"", fullDestPath, pathToZip);
            else
                fullArgs = string.Format("a -tzip -r -y -p{2} \"{0}\" \"{1}\"", fullDestPath, pathToZip, password);

            zip.StartInfo.WorkingDirectory = dirTo7Zip;
            zip.StartInfo.FileName = "7za";
        }
        else
        {
            pathToZip = Path.GetFullPath(pathToZip);

            if (string.IsNullOrEmpty(password))
                fullArgs = string.Format("-r \"{0}\" .", fullDestPath);
            else
                fullArgs = string.Format("-r -P {1} \"{0}\" .", fullDestPath, password);

			zip.StartInfo.WorkingDirectory = pathToZip;
            zip.StartInfo.FileName = "zip";
        }

        zip.StartInfo.Arguments = fullArgs;

        zip.Start();
    }

    public static string GetDropboxPath()
    {
        if (Application.platform == RuntimePlatform.WindowsEditor)
        {
            string dropboxDbPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "Dropbox\\host.db");
            string[] lines = File.ReadAllLines(dropboxDbPath);
            byte[] dbBase64Text = Convert.FromBase64String(lines[1]);
            string dropboxPath = System.Text.ASCIIEncoding.ASCII.GetString(dbBase64Text);

            return dropboxPath;
        }
        else
        {
            // mac users: 
            // sorry, can't do anything special to discover your Dropbox Folder.
            // please input it below.
            string dropboxPath = "/Path/to/Dropbox/";

            return dropboxPath;
        }
    }

    public static void MakeFilesWritable(string directory)
    {
        MakeFilesWritable(new DirectoryInfo(directory));
    }

    public static void MakeFilesWritable(DirectoryInfo directory)
    {
        if (!directory.Exists)
            return;

        FileInfo[] files = directory.GetFiles("*", SearchOption.AllDirectories);
        foreach (FileInfo file in files)
        {
            file.IsReadOnly = false;
        }
    }
}

