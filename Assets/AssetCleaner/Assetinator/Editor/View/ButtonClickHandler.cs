// Copyright 2016 Spin AG. For support contact assets@spin.de

using System;
using UnityEditor;
using UnityEngine;

namespace Spin.Assetinator {

    public static class ButtonClickHandler {
        private delegate void LeftClickHandler(AssetInfo asset);

        public static void SelectButtonClick(AssetInfo asset) {
            HandleClick(new LeftClickHandler(PingSelectAsset), asset);
        }

        public static void IgnoreButtonClick(AssetInfo asset) {
            HandleClick(new LeftClickHandler(ChangeIgnoreStatus), asset);
        }

        private static void HandleClick(LeftClickHandler leftClickEvent, AssetInfo asset) {
            if (Event.current.button == 0) {
                leftClickEvent(asset);
            } else if (Event.current.button == 1) {
                var contextMenu = new ContextMenu(asset.RelativePath, asset.IsDeletable());
                contextMenu.Show();
            } else {
                // do nothing
            }
        }

        private static void PingSelectAsset(AssetInfo assetInfo) {
            var asset = AssetDatabase.LoadAssetAtPath<UnityEngine.Object>(assetInfo.RelativePath);
            Type projectBrowserType = Type.GetType("UnityEditor.ProjectBrowser,UnityEditor");
            EditorWindow.GetWindow(projectBrowserType, false, null, true);
            Selection.activeObject = asset;
            EditorGUIUtility.PingObject(asset);
            // Workaround because window doesn't stay in front on Mac (Unity standard)
            AssetinatorWindow.GetInstanceAndFocus();
        }

        private static void ChangeIgnoreStatus(AssetInfo asset) {
            asset.ChangeIgnoreStatus();
        }
    }
}
