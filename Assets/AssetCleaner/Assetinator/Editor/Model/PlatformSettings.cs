// Copyright 2016 Spin AG. For support contact assets@spin.de

using System;
using UnityEngine;

namespace Spin.Assetinator {

    public static class PlatformSettings {

        private const string LogFolderMacOs = "/Library/Logs/Unity/Editor.log";
        private const string LogFolderWindows = "\\Unity\\Editor\\Editor.log";

        private const string ShowOnWindowsText = "Show in Explorer";
        private const string ShowOnMacOsText = "Show in Finder";

        public static readonly bool IsPlatformSupported;
        public static readonly string LogFilePath;
        public static readonly string ShowInFileSystemText;

        static PlatformSettings() {
            IsPlatformSupported = true;
            string userFolder;

            switch (Application.platform) {
                case RuntimePlatform.OSXEditor:
                    userFolder = Environment.GetFolderPath(Environment.SpecialFolder.Personal);
                    LogFilePath = userFolder + LogFolderMacOs;
                    ShowInFileSystemText = ShowOnMacOsText;
                    break;
                case RuntimePlatform.WindowsEditor:
                    userFolder = Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData);
                    LogFilePath = userFolder + LogFolderWindows;
                    ShowInFileSystemText = ShowOnWindowsText;
                    break;
                default:
                    IsPlatformSupported = false;
                    break;
            }
        }
    }
}
