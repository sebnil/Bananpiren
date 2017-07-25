// Copyright 2016 Spin AG. For support contact assets@spin.de

using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEditor;

namespace Spin.Assetinator {

    public class AssetInfo {
        public readonly string RelativePath;
        public readonly string FileName;
        public readonly string ParentPath;
        public readonly string Guid;

        private readonly HashSet<AssetInfo> children;
        private readonly MainSettings mainSettings;

        public AssetInfo(string path, MainSettings mainSettings) {
            RelativePath = path;
            ParentPath = Path.GetDirectoryName(path);
            FileName = Path.GetFileName(path);
            Guid = AssetDatabase.AssetPathToGUID(path);
            children = new HashSet<AssetInfo>();
            this.mainSettings = mainSettings;
        }

        public IEnumerable<AssetInfo> Children {
            get { return children; }
        }

        //Override Equals and GetHashCode for use in Hashset
        public override bool Equals(object obj) {
            var other = obj as AssetInfo;
            return other != null && RelativePath.Equals(other.RelativePath);
        }

        public override int GetHashCode() {
            return RelativePath.GetHashCode();
        }

        public void ChangeIgnoreStatus() {
            mainSettings.ChangeIgnoreStatus(Guid);
        }

        public bool IsIgnored() {
            return mainSettings.IsIgnored(Guid);
        }

        public bool IsExpandable(bool showIgnored) {
            return Children.Any(entry => entry.HasToBeDisplayed(showIgnored));
        }

        public bool HasToBeDisplayed(bool showIgnored) {
            if (children.Count == 0) {
                return IsIgnored() == showIgnored;
            }

            return IsIgnored() ? showIgnored : children.Any(child => child.HasToBeDisplayed(showIgnored));
        }

        public bool IsDeletable() {
            bool isFile = !AssetDatabase.IsValidFolder(RelativePath);
            bool isEmptyFolder = !AssetScanner.GetAssetsPaths(RelativePath).Any();
            return isFile || isEmptyFolder;
        }

        public void SynchronizeChildren(IEnumerable<AssetInfo> newChildren) {
            children.SynchronizeWith(newChildren);
        }
    }
}
