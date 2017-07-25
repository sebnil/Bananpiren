// Copyright 2016 Spin AG. For support contact assets@spin.de

using System.Collections.Generic;
using System.Linq;

namespace Spin.Assetinator {

    public class Seedling {
        public bool HasRemovedNodes{ get; private set; }

        private readonly HashSet<AssetInfo> tree;
        private readonly AssetInfo root;
        private readonly MainSettings mainSettings;
        private readonly Dictionary<string, HashSet<AssetInfo>> childNodes;

        public Seedling(AssetInfo treeRoot, MainSettings mainSettings) {
            tree = new HashSet<AssetInfo>();
            childNodes = new Dictionary<string, HashSet<AssetInfo>>();
            root = treeRoot;
            this.mainSettings = mainSettings;
        }

        public void AddBranch(string path) {
            string part = path;

            while (part != string.Empty) {
                // Create AssetInfo to check if asset is added in seedling.
                // TODO think of way to check without creation
                var assetInfo = new AssetInfo(part, mainSettings);
                if (tree.Contains(assetInfo) || root.Equals(assetInfo)) {
                    break;
                }

                CreateNode(assetInfo);
                part = assetInfo.ParentPath;
            }
        }

        public HashSet<AssetInfo> MergeWith(HashSet<AssetInfo> otherTree, bool rejectNew) {
            // Get old nodes with foldout states, GUI Content etc. for result
            var result = new HashSet<AssetInfo>(otherTree);
            // Remove deleted nodes in result
            result.IntersectWith(tree);

            if (rejectNew) {
                // Delete children entries that are generated since last build.
                // Important in lists of assets that you can't evaluate without fresh build.
                RemoveNewNodes(result);
            } else {
                // Add new nodes to result.
                // Used for initialization and assets you can evaluate to be in a list of special assets
                result.UnionWith(tree);
            }
            // Merge child nodes in result
            CopyChildNodes(result);
            return result;
        }

        private void CreateNode(AssetInfo node) {
            tree.Add(node);
            if (!childNodes.ContainsKey(node.ParentPath)) {
                childNodes.Add(node.ParentPath, new HashSet<AssetInfo>());
            }
            childNodes[node.ParentPath].Add(node);
        }

        private void RemoveNewNodes(ICollection<AssetInfo> otherTree) {
            HasRemovedNodes = false;
            foreach (AssetInfo node in tree) {
                if (otherTree.Contains(node)) {
                    continue;
                }
                childNodes.Remove(node.RelativePath);
                if (childNodes.ContainsKey(node.ParentPath)) {
                    childNodes[node.ParentPath].Remove(node);
                }
                HasRemovedNodes = true;
            }
        }

        private void CopyChildNodes(HashSet<AssetInfo> otherTree) {
            SetNewChildren(root);

            foreach (AssetInfo node in otherTree) {
                SetNewChildren(node);
            }
        }

        private void SetNewChildren(AssetInfo node) {
            bool exist = childNodes.ContainsKey(node.RelativePath);
            var newChildren = exist ? childNodes[node.RelativePath] : Enumerable.Empty<AssetInfo>();
            node.SynchronizeChildren(newChildren);
        }
    }
}
