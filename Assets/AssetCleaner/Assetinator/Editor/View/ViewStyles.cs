// Copyright 2016 Spin AG. For support contact assets@spin.de

using UnityEditor;
using UnityEngine;

namespace Spin.Assetinator {

    public static class ViewStyles {
        public static readonly GUIContent DummyContent = new GUIContent("T");

        public static GUIStyle NormalLabel { get; private set; }
        public static GUIStyle IgnoredLabel { get; private set; }
        public static GUIStyle Line { get; private set; }
        public static GUIStyle ScrollView { get; private set; }
        public static GUIStyle SelectionButton { get; private set; }
        public static GUIStyle StatusBarLabel { get; private set; }

        public static GUIContent IgnoreContent { get; private set; }
        public static GUIContent UnIgnoreContent { get; private set; }

        public static GUIContent CollapseContent { get; private set; }
        public static GUIContent ExpandContent { get; private set; }
        public static Color IconColor { get; private set; }

        private static readonly RectOffset ZeroOffset = new RectOffset(0, 0, 0, 0);

        private const float Saturation = 185f / 255f;
        private static readonly Color ProIconColor = new Color(Saturation, Saturation, Saturation);
        private static readonly Color StandardIconColor = Color.black;

        public static void Initialize() {
            NormalLabel = new GUIStyle(GUI.skin.label);
            NormalLabel.padding = ZeroOffset;
            IgnoredLabel = CreateLabel(Color.gray);

            IgnoreContent = new GUIContent(GuiUtils.LoadIcon("Ignore.png"));
            UnIgnoreContent = new GUIContent(GuiUtils.LoadIcon("UnIgnore.png"));
            CollapseContent = new GUIContent(GuiUtils.LoadIcon("Collapse.png"));
            ExpandContent = new GUIContent(GuiUtils.LoadIcon("Expand.png"));

            Line = CreateLine();
            ScrollView = CreateScrollView();

            StatusBarLabel = CreateStatusBarLabel();

            if (EditorGUIUtility.isProSkin) {
                IconColor = ProIconColor;
                SelectionButton = CreateProSkinSelectionButton();
            } else {
                IconColor = StandardIconColor;
                SelectionButton = CreatePersonalSkinSelectionButton();
            }
        }

        private static GUIStyle CreateLabel(Color color) {
            var normalState = new GUIStyleState();
            normalState.textColor = color;

            return new GUIStyle(GUI.skin.label) {
                normal = normalState,
                padding = ZeroOffset
            };
        }

        private static GUIStyle CreateLine() {
            var style = new GUIStyle(EditorStyles.inspectorDefaultMargins) {
                padding = ZeroOffset,
                fixedHeight = Assetinator.Line.Height
            };
            return style;
        }

        private static GUIStyle CreateScrollView() {
            return new GUIStyle {
                padding = new RectOffset(0, 0, 0, Mathf.FloorToInt(Assetinator.Line.Height / 4))
            };
        }

        // Doesn't work for ProSkin, because gradient looks buggy.
        private static GUIStyle CreatePersonalSkinSelectionButton() {
            // We can't use the largebuttonmid here, because it has no border on the right side in
            // normal state. So we use the toolbarButton and clone largebuttonmid's look where
            // possible.
            var largeButton = new GUIStyle("largebuttonmid");
            return new GUIStyle(EditorStyles.toolbarButton) {

                // Don't scale fontsize: use default fontsize
                fontSize = GUI.skin.font.fontSize,
                fixedHeight = largeButton.CalcSize(DummyContent).y,
                padding = new RectOffset(largeButton.padding.left, largeButton.padding.right, 0, 0),
                onNormal = largeButton.onNormal,
                onActive = largeButton.onActive
            };
        }

        // Doesn't work for PersonalSkin, because normal button blurs with background.
        private static GUIStyle CreateProSkinSelectionButton() {
            return new GUIStyle("largebuttonmid") {
                normal = EditorStyles.toolbarButton.normal,
                fontSize = GUI.skin.font.fontSize
            };
        }

        private static GUIStyle CreateStatusBarLabel() {
            return new GUIStyle(EditorStyles.miniLabel) {
                richText = true
            };
        }
    }
}
