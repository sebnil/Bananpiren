// Copyright 2016 Spin AG. For support contact assets@spin.de

using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;

namespace Spin.Assetinator {

    public static class AssetLoader {
        private const string DirectorySeparator = "/";

        public static T Load<T>(string path) where T : ScriptableObject {
            return AssetDatabase.LoadAssetAtPath<T>(path) ?? CreateAt<T>(path);
        }

        private static T CreateAt<T>(string path) where T : ScriptableObject {
            CreateMissingFolders(path);

            // Can't be done in constructor
            var instance = ScriptableObject.CreateInstance<T>();
            AssetDatabase.CreateAsset(instance, path);
            return instance;
        }

        private static void CreateMissingFolders(string path) {
            var folderPath = Path.GetDirectoryName(path);
            var missingFolders = new List<string>();

            while (!AssetDatabase.IsValidFolder(folderPath)) {
                int lastSeperatorIndex = folderPath.LastIndexOf(DirectorySeparator);
                missingFolders.Add(folderPath.Substring(lastSeperatorIndex + 1));
                folderPath = folderPath.Remove(lastSeperatorIndex);
            }

            for (int i = missingFolders.Count - 1; i >= 0; i--) {
                AssetDatabase.CreateFolder(folderPath, missingFolders[i]);
                folderPath = folderPath + DirectorySeparator + missingFolders[i];
            }
        }
    }
}
