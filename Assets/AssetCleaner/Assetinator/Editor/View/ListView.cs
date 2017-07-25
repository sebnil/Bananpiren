// Copyright 2016 Spin AG. For support contact assets@spin.de

using System.Collections.Generic;
using UnityEngine;

namespace Spin.Assetinator {

    public class ListView {
        private const int TabSize = 15;

        private readonly Dictionary<int, LineManager> linesByViewId;
        private readonly AssetTree tree;

        private readonly ScrollView scrollView = new ScrollView();

        private int indentationLevel;
        private bool showIgnored;
        private LineManager currentLines;

        public ListView(AssetTree assetTree, IEnumerable<int> viewIds, TempSettings tempSettings) {
            tree = assetTree;

            linesByViewId = new Dictionary<int, LineManager>();
            AssetInfo[] roots = { tree.Root };
            foreach (int id in viewIds) {
                linesByViewId.Add(id, new LineManager(id, tempSettings));
                linesByViewId[id].Expand(roots);
            }
        }

        public void Set(int viewId, bool showIgnored) {
            this.showIgnored = showIgnored;
            currentLines = linesByViewId[viewId];
            scrollView.Initialize();
        }

        public void Draw(bool hasCollapseCommand, bool hasExpandCommand, float margin) {
            if (tree.IsEmpty(showIgnored)) {
                GUILayout.Label(tree.GetEmptyTreeMessage(showIgnored));
            } else {
                ExpandCollapse(hasCollapseCommand, hasExpandCommand);

                scrollView.Begin();
                DisplayAssets(new [] { tree.Root }, margin);
                scrollView.End();
            }
        }

        private void ExpandCollapse(bool hasCollapseCommand, bool hasExpandCommand) {
            if (hasExpandCommand) {
                currentLines.Expand(new [] { tree.Root });
                currentLines.Expand(tree.Nodes);
            } else if (hasCollapseCommand) {
                currentLines.Collapse(tree.Nodes);
            } else {
                // do nothing
            }
        }

        private void DisplayAssets(IEnumerable<AssetInfo> assets, float margin) {
            foreach (AssetInfo entry in assets) {
                if (entry.HasToBeDisplayed(showIgnored)) {
                    DisplayAsset(entry, margin);
                }
            }
        }

        private void DisplayAsset(AssetInfo asset, float margin) {
            indentationLevel++;
            var line = currentLines.Get(asset);
            var indentation = (indentationLevel - 1) * TabSize + margin;
            scrollView.Display(line, indentation, showIgnored);

            if (line.IsExpanded()) {
                DisplayAssets(asset.Children, margin);
            }
            indentationLevel--;
        }
    }
}
