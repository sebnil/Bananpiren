// Copyright 2016 Spin AG. For support contact assets@spin.de

using UnityEditor;
using UnityEngine;

namespace Spin.Assetinator {

    public class MainSettings : ScriptableObject {
        // Not readonly because of serialization
        [SerializeField][HideInInspector]
        private SerializableGuidHashSet IgnoredAssets = new SerializableGuidHashSet();

        private MainSettings() {}

        public static MainSettings Load(string path) {
            var instance = AssetLoader.Load<MainSettings>(path);
            instance.CleanUp();
            return instance;
        }

        public bool IsIgnored(string guid) {
            return IgnoredAssets.Contains(guid);
        }

        public void ChangeIgnoreStatus(string guid) {
            if (IsIgnored(guid)) {
                IgnoredAssets.Remove(guid);
            } else {
                IgnoredAssets.Add(guid);
            }
            EditorUtility.SetDirty(this);
        }

        private void CleanUp() {
            IgnoredAssets.CleanUp();
            EditorUtility.SetDirty(this);
        }
    }
}
