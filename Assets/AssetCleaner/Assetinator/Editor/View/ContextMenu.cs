// Copyright 2016 Spin AG. For support contact assets@spin.de

using UnityEditor;
using UnityEngine;

namespace Spin.Assetinator {

    public class ContextMenu {
        private const string CopyText = "Copy Path To Clipboard";
        private const string DeleteText = "Move to Trash";

        private const string DialogTitle = "Move selected asset to trash?";
        private const string OkLabel = "Delete";
        private const string CancelLabel = "Cancel";

        private static readonly GUIContent CopyPathContent = new GUIContent(CopyText);
        private static readonly GUIContent MoveToTrashContent = new GUIContent(DeleteText);
        private static readonly GUIContent ShowInFileSystemContent =
            new GUIContent(PlatformSettings.ShowInFileSystemText);

        private readonly GenericMenu menu = new GenericMenu();

        public ContextMenu(string path, bool isDeletable) {
            menu.AddItem(ShowInFileSystemContent, false, ShowInFileSystem, path);
            menu.AddItem(CopyPathContent, false, CopyToClipboard, path);

            menu.AddSeparator("");

            if (isDeletable) {
                menu.AddItem(MoveToTrashContent, false, MoveToTrash, path);
            } else {
                menu.AddDisabledItem(MoveToTrashContent);
            }
        }

        public void Show() {
            menu.ShowAsContext();
        }

        private static void ShowInFileSystem(object path) {
            EditorUtility.RevealInFinder((string) path);
        }

        private static void CopyToClipboard(object path) {
            EditorGUIUtility.systemCopyBuffer = (string) path;
        }

        private static void MoveToTrash(object path) {
            var assetPath = (string) path;
            if (EditorUtility.DisplayDialog(DialogTitle, assetPath, OkLabel, CancelLabel)) {
                AssetDatabase.MoveAssetToTrash(assetPath);
            }
        }
    }
}
