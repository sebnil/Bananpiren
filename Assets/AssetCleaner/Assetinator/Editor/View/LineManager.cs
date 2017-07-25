// Copyright 2016 Spin AG. For support contact assets@spin.de

using System.Collections.Generic;

namespace Spin.Assetinator {

    public class LineManager {
        private readonly Dictionary<AssetInfo, Line> lines = new Dictionary<AssetInfo, Line>();
        private readonly int viewId;
        private readonly TempSettings tempSettings;

        public LineManager(int viewId, TempSettings tempSettings) {
            this.viewId = viewId;
            this.tempSettings = tempSettings;
        }

        public Line Get(AssetInfo asset) {
            if (!lines.ContainsKey(asset)) {
                lines.Add(asset, new Line(asset, viewId, tempSettings));
            }
            return lines[asset];
        }

        public void Expand(IEnumerable<AssetInfo> assets) {
            foreach (AssetInfo entry in assets) {
                Get(entry).Expand();
            }
        }

        public void Collapse(IEnumerable<AssetInfo> assets) {
            foreach (AssetInfo entry in assets) {
                Get(entry).Collapse();
            }
        }
    }
}
