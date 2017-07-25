// Copyright 2016 Spin AG. For support contact assets@spin.de

using UnityEditor;
using UnityEngine;

namespace Spin.Assetinator {

    public class AssetinatorSettings {

        private const string SettingsPath = "/Settings";
        private const string TempSettingsPath = "/TempSettings.asset";
        private const string MainSettingsPath = "/MainSettings.asset";
        private const string RemovedText = AssetinatorWindow.AppLabel +
            ": restarting because of deleted settings.";

        private readonly string mainPath;
        private readonly string tempPath;

        public AssetinatorSettings(string assetinatorPath) {
            string settingsPath = assetinatorPath + SettingsPath;
            mainPath = settingsPath + MainSettingsPath;
            tempPath = settingsPath + TempSettingsPath;
        }

        public MainSettings Main {
            get { return MainSettings.Load(mainPath); }
        }

        public TempSettings Temp {
            get { return TempSettings.Load(tempPath); }
        }

        public bool AreOk() {
            var mainSettings = AssetDatabase.LoadAssetAtPath<MainSettings>(mainPath);
            var tempSettings = AssetDatabase.LoadAssetAtPath<TempSettings>(tempPath);

            bool areOk = mainSettings != null && tempSettings != null;
            if (!areOk) {
                Debug.LogWarning(RemovedText);
            }

            return areOk;
        }
    }
}
