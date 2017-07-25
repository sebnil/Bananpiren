// Copyright 2016 Spin AG. For support contact assets@spin.de

using System;
using System.IO;
using UnityEngine;
using UnityEditor;

namespace Spin.Assetinator {

    public sealed class AssetinatorInstance {
        public const string CurrentVersion = "1.0.1";
        private const string SearchFolder = "Assets";

        private readonly static AssetinatorSettings settings;

        private static AssetinatorInstance Instance;

        private AssetinatorWindow window;
        private bool isInitializing;
        private AssetTree tree;

        static AssetinatorInstance() {
            var assetinatorPath = GetAssetinatorPath();
            settings = new AssetinatorSettings(assetinatorPath);
            GuiUtils.SetIconPath(assetinatorPath);
        }

        private AssetinatorInstance() {}

        private void Initialize(AssetinatorWindow newWindow) {
            isInitializing = true;

            window = newWindow;
            tree = new AssetTree(SearchFolder, settings);

            if (settings.Temp.ProjectWasJustBuilt || settings.Temp.Paths == null) {
                tree.Initialize();
                settings.Temp.ProjectWasJustBuilt = false;
            } else {
                tree.Initialize(settings.Temp.Paths);
                tree.AdjustToLastBuild();
            }

            window.PrepareInitialize(tree, settings.Temp);

            isInitializing = false;
        }

        public static AssetinatorInstance Get(AssetinatorWindow window) {
            if (Instance == null) {
                Instance = new AssetinatorInstance();
            }

            if (Instance.window != window) {
                Instance.Initialize(window);
            }

            return Instance;
        }

        public static void OnFileChange() {
            settings.Temp.ProcessFileChange();
        }

        public static void OnBuildFinished(bool hasMissingScenes) {
            settings.Temp.ProcessBuild(hasMissingScenes);
        }

        public void HandleProjectChange() {
            if (isInitializing) {
                return;
            }

            if (settings.AreOk()) {
                tree.AdjustToLastBuild();
            } else {
                Initialize(window);
            }
        }

        public static string GetAssetinatorPath() {
            var origin = ScriptableObject.CreateInstance<TempSettings>();
            var windowPath = AssetDatabase.GetAssetPath(MonoScript.FromScriptableObject(origin));
            return Directory.GetParent(Path.GetDirectoryName(windowPath)).ToString();
        }
    }
}
