// Copyright 2016 Spin AG. For support contact assets@spin.de

using System.Linq;
using UnityEditor;
using UnityEditor.Callbacks;
using UnityEngine;

namespace Spin.Assetinator {

    public class PostProcessor : AssetPostprocessor {

        private static void OnPostprocessAllAssets(string[] importedAssets,
            string[] deletedAssets, string[] movedAssets, string[] movedFromAssetPaths) {

            if (importedAssets.Any() || movedAssets.Any()) {
                AssetinatorInstance.OnFileChange();
            }
        }

        [PostProcessBuild]
        private static void OnPostprocessBuild(BuildTarget target, string pathToBuiltProject) {
            // coming this far means there exists at least 1 .unity file in the project
            var hasMissingScenes = HasMissingScenes(
                AssetDatabase.FindAssets("t:scene").Count(),
                EditorBuildSettings.scenes.Count(scene => scene.enabled));
            AssetinatorInstance.OnBuildFinished(hasMissingScenes);

            var windows = Resources.FindObjectsOfTypeAll<AssetinatorWindow>();
            if (windows.Length > 0) {
                windows[0].OnBuildFinished();
            }
        }

        private static bool HasMissingScenes(int inProject, int enabledInBuildSettings) {
            return inProject > enabledInBuildSettings;
        }
    }
}
