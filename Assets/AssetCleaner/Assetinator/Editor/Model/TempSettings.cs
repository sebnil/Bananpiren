// Copyright 2016 Spin AG. For support contact assets@spin.de

using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

namespace Spin.Assetinator {

    public class TempSettings : ScriptableObject {
        // Display data:

        [SerializeField][HideInInspector]
        private int selectedViewId;

        // Not readonly because of serialization
        [SerializeField][HideInInspector]
        private List<SerializableGuidHashSet> ExpandedAssets = new List<SerializableGuidHashSet>();

        // Internal data:
        // It's stored here, to make it accessible even if Assetinator was in background / not running.

        // Used to recover the Build log Outdated information (e.g. after compiling).
        // Don't initialize with empty list here, because we need the value null to determine that
        // nothing was saved yet.
        [SerializeField][HideInInspector]
        private List<string> paths = null;

        // Used to decide, whether the AssetTree needs to be created with freshly evaluated
        // paths (after a current build) or with the stored paths (e.g. after compiling).
        [SerializeField][HideInInspector]
        private bool projectWasJustBuilt;

        [SerializeField][HideInInspector]
        private bool hasMissingScenesInBuild;

        private TempSettings() {}

        public List<string> Paths {
            get { return paths; }
            set {
                paths = value;
                EditorUtility.SetDirty(this);
            }
        }

        public bool ProjectWasJustBuilt {
            get { return projectWasJustBuilt; }
            set {
                projectWasJustBuilt = value;
                EditorUtility.SetDirty(this);
            }
        }

        public static TempSettings Load(string path) {
            var instance = AssetLoader.Load<TempSettings>(path);
            instance.CleanUp();
            return instance;
        }

        public void ExpandAsset(int viewId, string guid) {
            GetExpandedAssets(viewId).Add(guid);
            EditorUtility.SetDirty(this);
        }

        public void CollapseAsset(int viewId, string guid) {
            GetExpandedAssets(viewId).Remove(guid);
            EditorUtility.SetDirty(this);
        }

        public bool IsExpandedAsset(int viewId, string guid) {
            return GetExpandedAssets(viewId).Contains(guid);
        }

        public void SetSelectedViewId(int viewId){
            selectedViewId = viewId;
            EditorUtility.SetDirty(this);
        }

        public int GetSelectedViewId() {
            return selectedViewId;
        }

        public void ProcessFileChange() {
            ProjectWasJustBuilt = false;
        }

        public void ProcessBuild(bool hasMissingScenes) {
            ProjectWasJustBuilt = true;
            hasMissingScenesInBuild = hasMissingScenes;
        }

        public void TriggerWarnings() {
            if (hasMissingScenesInBuild) {
                hasMissingScenesInBuild = false;

                Debug.LogWarning("Assetinator: There are scenes in your project, " +
                    "which are not included in the build.\nAssetinator may misleadingly report " +
                    "assets used in the missing scenes as 'unused'. Please add all scenes to " +
                    "your Build Settings to ensure Assetinator works as expected.");
            }
        }

        private SerializableGuidHashSet GetExpandedAssets(int viewId) {
            while (viewId > ExpandedAssets.Count - 1) {
                ExpandedAssets.Add(new SerializableGuidHashSet());
            }
            return ExpandedAssets[viewId];
        }

        private void CleanUp() {
            foreach (SerializableGuidHashSet guids in ExpandedAssets) {
                guids.CleanUp();
            }
            EditorUtility.SetDirty(this);
        }
    }
}
