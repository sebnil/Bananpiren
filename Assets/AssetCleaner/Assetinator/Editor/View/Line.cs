// Copyright 2016 Spin AG. For support contact assets@spin.de

using UnityEditor;
using UnityEngine;

namespace Spin.Assetinator {

    public class Line {
        public static readonly float Height = Mathf.Round(GUI.skin.label.font.fontSize * 1.5f);
        public static readonly Vector2 IconDimension = new Vector2(Height, Height);

        private const float SpaceAfterText = 3f;

        private static readonly Texture2D Foldout = EditorStyles.foldout.normal.background;
        private static readonly Vector2 FoldoutSize = new Vector2(Foldout.height, Foldout.width);
        private static readonly Vector2 TooltipOffset = new Vector2(0, -(Height + 1));
        private static readonly Tooltip Tooltip = new Tooltip(TooltipOffset);

        private readonly AssetInfo asset;
        private readonly int viewId;
        private readonly TempSettings tempSettings;

        private GUILayoutOption labelWidth;
        private Texture icon;
        private GUIContent label;

        private Rect rect;
        private bool hasMouseOver;
        private bool isExpanded;

        public Line(AssetInfo asset, int viewId, TempSettings tempSettings) {
            this.asset = asset;
            this.viewId = viewId;
            this.tempSettings = tempSettings;
            isExpanded = tempSettings.IsExpandedAsset(viewId, asset.Guid);
        }

        public void Draw(float indentation, bool showIgnored) {
            EditorGUIUtility.SetIconSize(Line.IconDimension);
            rect = EditorGUILayout.BeginHorizontal(ViewStyles.Line);
            DrawContent(indentation, showIgnored);
            EditorGUILayout.EndHorizontal();
        }

        public void Expand() {
            isExpanded = true;
            tempSettings.ExpandAsset(viewId, asset.Guid);
        }

        public void Collapse() {
            isExpanded = false;
            tempSettings.CollapseAsset(viewId, asset.Guid);
        }

        public bool IsExpanded() {
            return isExpanded;
        }

        private void DrawContent(float indentation, bool showIgnored) {
            GUILayout.Space(indentation + Foldout.width);
            DrawFoldoutToggle(indentation, showIgnored);
            // SelectButton creates and leaves free rect for ignoreButton,
            // because rear button steals click from top button (Unity bug).
            Rect ignoreButtonRect = DrawSelectButton();
            DrawIgnoreButtonAndTooltips(ignoreButtonRect);
        }

        private void DrawFoldoutToggle(float indentation, bool showIgnored) {
            if (!asset.IsExpandable(showIgnored)) {
                return;
            }

            var position = new Vector2(indentation, rect.y + Height / 4);
            var foldoutRect = new Rect(position, FoldoutSize);
            bool wasExpanded = GUI.Toggle(foldoutRect, isExpanded, string.Empty, EditorStyles.foldout);

            if (wasExpanded) {
                Expand();
            } else {
                Collapse();
            }
        }

        private void InitializeSelectButtonContent() {
            // Use the icon to check whether the label has to be initialized, because Unity
            // serializes a fileId instead of a reference to a texture object in GUIContent.
            // The fileId is null for temporary icons (e.g. pictures), so - in this case - Unity
            // loses the icon information upon serialization.
            if (icon != null) {
                return;
            }

            icon = AssetDatabase.GetCachedIcon(asset.RelativePath);
            label = new GUIContent(asset.FileName, icon);
            float minimalLabelWidth = GuiUtils.MinimalWidth("label", label) + SpaceAfterText;
            labelWidth = GUILayout.Width(minimalLabelWidth);
        }

        private Rect DrawSelectButton() {
            // Initialize here, because we are using OnGUI Functions.
            InitializeSelectButtonContent();
            DrawSelectButtonPart(label, new [] { labelWidth });
            Rect ignoreButtonRect = CreateSpaceForIgnoreButton();
            DrawSelectButtonPart(GUIContent.none, new GUILayoutOption[0]);
            return ignoreButtonRect;
        }

        private void DrawSelectButtonPart(GUIContent content, GUILayoutOption[] options) {
            GUIStyle style = asset.IsIgnored() ? ViewStyles.IgnoredLabel : ViewStyles.NormalLabel;
            if (GUILayout.Button(content, style, options)) {
                ButtonClickHandler.SelectButtonClick(asset);
            }
        }

        private static Rect CreateSpaceForIgnoreButton() {
            Rect firstSelectRect = GUILayoutUtility.GetLastRect();
            GUILayout.Space(IgnoreButton.Size.x);
            return GuiUtils.GetRectOnRightHandSide(firstSelectRect, IgnoreButton.Size);
        }

        private void DrawIgnoreButtonAndTooltips(Rect firstSelectRect) {
            if (HasMouseOver() && !(AssetinatorWindow.IsDisabled())) {
                var button = IgnoreButton.GetInstance();
                bool isPreparingTooltip = button.Refresh(firstSelectRect, asset);
                Tooltip.Draw(rect, asset.RelativePath, isPreparingTooltip);
            }
        }

        private bool HasMouseOver() {
            // Repaint command consists of two events: layout and repaint.
            // mousePosition is only set during repaint.repaint.
            // So here we set the hasMouseOver for the next repaint command, and so the next reapint.layout event.
            // We are saving the flag to determine, if the Ignorebutton should be drawn here, because
            // if we would use a local variable in caller of UpdateHasMouseOver, it would be false
            // in layout event and true in repaint event. As result we would see a button that we can't click on
            if (Event.current.type == EventType.Repaint) {
                hasMouseOver = rect.Contains(Event.current.mousePosition);
            }
            return hasMouseOver;
        }

        public static void ClearTooltips() {
            Tooltip.Clear();
            IgnoreButton.GetInstance().ClearTooltip();
        }
    }
}
