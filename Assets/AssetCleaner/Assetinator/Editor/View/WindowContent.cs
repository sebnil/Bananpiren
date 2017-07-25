// Copyright 2016 Spin AG. For support contact assets@spin.de

using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

namespace Spin.Assetinator {

    public class WindowContent {
        private const string VersionText =
            "<color=#727272><b>v" + AssetinatorInstance.CurrentVersion + "</b></color>";

        private const string BuildLogOutdatedText =
            "<color=yellow><b>Build log Outdated</b></color>";

        private const float Margin = 12f;
        private const int IgnoreViewId = 1;
        private static readonly string[] ViewSelectionTexts = { "Unused", "Ignored" };

        private readonly AssetTree assets;
        private readonly ListView listView;
        private readonly ButtonPanel buttonPanel;
        private readonly TempSettings tempSettings;

        private Vector2 versionTextSize;
        private float buildLogOutdatedWidth;
        private int selectedViewId = -1; // init with incorrect value

        public WindowContent(AssetTree assetTree, TempSettings tempSettings) {
            assets = assetTree;
            this.tempSettings = tempSettings;
            buttonPanel = new ButtonPanel(ViewSelectionTexts);
            listView = new ListView(assets, GetViewIds(), tempSettings);
        }

        public void Initialize() {
            SetSelectedViewId(tempSettings.GetSelectedViewId());
            versionTextSize = ViewStyles.StatusBarLabel.CalcSize(new GUIContent(VersionText));
            var buildLogOutdatedContent = new GUIContent(BuildLogOutdatedText);
            buildLogOutdatedWidth = ViewStyles.StatusBarLabel.CalcSize(buildLogOutdatedContent).x;
            buttonPanel.Initialize();
        }

        public void Draw(float windowWidth) {
            Line.ClearTooltips();

            EditorGUI.BeginDisabledGroup(AssetinatorWindow.IsDisabled());
            DrawHeader(windowWidth);
            listView.Draw(buttonPanel.HasCollapseCommand, buttonPanel.HasExpandCommand, Margin);
            EditorGUI.EndDisabledGroup();

            // Draw Tooltip outside the group rect and at last, so it's not overdrawn.
            buttonPanel.DrawTooltip();
        }

        public float GetMinimalWidth() {
            return buttonPanel.GetMinimalWidth() + 2 * Margin;
        }

        private void SetSelectedViewId(int viewId) {
            if (selectedViewId == viewId) {
                return;
            }

            selectedViewId = viewId;
            listView.Set(selectedViewId, IsIgnoreView());
            tempSettings.SetSelectedViewId(selectedViewId);
        }

        private bool IsIgnoreView() {
            return IgnoreViewId == selectedViewId;
        }

        private static IEnumerable<int> GetViewIds() {
            for (int i = 0; i < ViewSelectionTexts.Length; i++) {
                yield return i;
            }
        }

        private void DrawHeader(float windowWidth) {
            float width = windowWidth - 2 * Margin;
            var buttonPanelRect = new Rect(Margin, Margin, width, buttonPanel.GetMinimalHeight());
            DrawButtonPanel(buttonPanelRect);

            var statusBarRect = new Rect(Margin, buttonPanelRect.yMax, width, versionTextSize.y);
            DrawStatusBar(statusBarRect);

            DrawSeparator(statusBarRect.yMax + 0.25f * Margin, windowWidth);

            // make Header visible to GUILayout.Objects
            GUILayout.Space(statusBarRect.yMax + 0.5f * Margin);
        }

        private void DrawButtonPanel(Rect buttonPanelRect) {
            buttonPanel.SetDisabledStatus(assets.IsDefective, assets.IsEmpty(IsIgnoreView()));
            int viewId = buttonPanel.Draw(buttonPanelRect, selectedViewId);
            SetSelectedViewId(viewId);
        }

        private void DrawStatusBar(Rect statusBarRect) {
            GUI.BeginGroup(statusBarRect);
            GUI.Label(new Rect(Vector2.zero, versionTextSize), VersionText, ViewStyles.StatusBarLabel);
            DrawOutdatedStatus(statusBarRect);
            GUI.EndGroup();
        }

        private void DrawOutdatedStatus(Rect parentRect) {
            if (assets.IsOutdated) {
                Rect outdatedRect = GuiUtils.GetChildRectAlignedToRight(parentRect, buildLogOutdatedWidth);
                GUI.Label(outdatedRect, BuildLogOutdatedText, ViewStyles.StatusBarLabel);
            }
        }

        private static void DrawSeparator(float yCoordinate, float width) {
            Handles.BeginGUI();
            Handles.color = EditorGUIUtility.isProSkin ? ViewStyles.IconColor : Color.white;
            Handles.DrawLine(new Vector2(0, yCoordinate), new Vector2(width, yCoordinate));
            Handles.EndGUI();
        }
    }
}
