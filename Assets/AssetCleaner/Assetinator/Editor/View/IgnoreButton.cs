// Copyright 2016 Spin AG. For support contact assets@spin.de

using UnityEngine;

namespace Spin.Assetinator {

    public class IgnoreButton {
        public static readonly Vector2 Size = new Vector2(1.5f * Line.Height, Line.Height);
        private static readonly Vector2 TooltipOffset = new Vector2(Size.x + 1, 0);
        private static readonly IgnoreButton Instance = new IgnoreButton();

        private readonly Tooltip tooltip;

        private IgnoreButton() {
            tooltip = new Tooltip(TooltipOffset);
        }

        public static IgnoreButton GetInstance() {
            return Instance;
        }

        public bool Refresh(Rect ignoreButtonRect, AssetInfo asset) {
            GUIContent content = asset.IsIgnored() ? ViewStyles.UnIgnoreContent : ViewStyles.IgnoreContent;

            string text = asset.IsIgnored() ? "Unignore" : "Ignore";
            tooltip.Draw(ignoreButtonRect, text);

            if (GuiUtils.ColoredContentButton(ignoreButtonRect, content, ViewStyles.IconColor)) {
                ButtonClickHandler.IgnoreButtonClick(asset);
            }
            return tooltip.HasCountingTimer();
        }

        public void ClearTooltip() {
            tooltip.Clear();
        }
    }
}
