// Copyright 2016 Spin AG. For support contact assets@spin.de

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEditor;

namespace Spin.Assetinator {

    public static class AssetScanner {

        public static List<string> GetIdleAssetsPaths(string logFolder, string searchFolder) {
            var projectAssetsPaths = GetAssetsPaths(searchFolder);
            return projectAssetsPaths
                .Except(LogFileParser.GetUsedAssets(logFolder))
                .Except(GetIconPaths())
                .Where<string>(path => IsEmptyDirectoryOrFile(path) && !IsSpecialAsset(path))
                .ToList();
        }

        public static IEnumerable<string> GetAssetsPaths(string searchFolder) {
            string[] searchFolderArray = { searchFolder };
            var guids = AssetDatabase.FindAssets(string.Empty, searchFolderArray);
            return guids.Select(guid => AssetDatabase.GUIDToAssetPath(guid));
        }

        public static bool IsSpecialAsset(string path) {
            return path.StartsWith("Assets/Editor Default Resources/") ||
                   path.StartsWith("Assets/WebGLTemplates/") ||
                   path.StartsWith("Assets/WebPlayerTemplates/") ||
                   path.Contains("/Assetinator/") ||
                   path.Contains("/Editor/") ||
                   path.Contains("/Gizmos/") ||
                   path.Contains("/Plugins/") ||
                   path.Contains("/StreamingAssets/") ||
                   path.EndsWith(".prefab") ||
                   path.EndsWith(".unity");
        }

        private static bool IsEmptyDirectoryOrFile(string path) {
            return !AssetDatabase.IsValidFolder(path) ||
            (!Directory.GetDirectories(path).Any() && !Directory.GetFiles(path).Any());
        }

        private static IEnumerable<string> GetIconPaths() {
            var buildTargets = (BuildTargetGroup[])Enum.GetValues(typeof(BuildTargetGroup));
            return buildTargets
                .SelectMany(target => PlayerSettings.GetIconsForTargetGroup(target))
                .Where(icon => icon != null)
                .Select(icon => AssetDatabase.GetAssetPath(icon));
        }
    }
}
