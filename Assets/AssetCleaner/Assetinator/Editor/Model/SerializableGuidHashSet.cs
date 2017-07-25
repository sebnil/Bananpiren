// Copyright 2016 Spin AG. For support contact assets@spin.de

using System.Collections.Generic;
using System.Linq;
using UnityEditor;
using UnityEngine;

namespace Spin.Assetinator {
    [System.Serializable]
    public class SerializableGuidHashSet : ISerializationCallbackReceiver {

        [SerializeField][HideInInspector]
        private List<string> storedGuids = new List<string>();
        private HashSet<string> guids = new HashSet<string>();

        #region ISerializationCallbackReceiver implementation

        public void OnBeforeSerialize() {
            storedGuids = guids.ToList();
        }

        public void OnAfterDeserialize() {
            guids = new HashSet<string>(storedGuids);
        }

        #endregion

        public void Add(string guid) {
            guids.Add(guid);
        }

        public void Remove(string guid) {
            guids.Remove(guid);
        }

        public bool Contains(string guid) {
            return guids.Contains(guid);
        }

        public void CleanUp() {
            var updatedGuids = new HashSet<string>();
            foreach (string guid in guids) {
                string path = AssetDatabase.GUIDToAssetPath(guid);
                if (string.IsNullOrEmpty(path) || path.StartsWith("Assets/__DELETED_GUID_Trash")) {
                    continue;
                }
                updatedGuids.Add(guid);
            }
            guids = updatedGuids;
        }
    }
}
