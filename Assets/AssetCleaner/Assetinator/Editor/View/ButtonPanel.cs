// Copyright 2016 Spin AG. For support contact assets@spin.de

using System;
using System.Linq;
using UnityEditor;
using UnityEngine;

namespace Spin.Assetinator {

    public class ButtonPanel {
        private const string BuildButtonText = "Build Project";
        private const string CollapseTooltipText = "Collapse All";
        private const string ExpandTooltipText = "Expand All";

        public bool HasCollapseCommand { get; private set; }
        public bool HasExpandCommand { get; private set; }

        private readonly float GroupOffset;
        private readonly string[] selectionTexts;

        // members that where readonly, if they could be set in constructor
        private bool isInitialized;
        private float selectionButtonWidth;
        private float minimalHeight;
        private float buildButtonWidth;
        private Rect selectionRect;
        private Rect collapseRect;
        private Rect expandRect;
        private Tooltip tooltip;

        // actual changing members
        private Rect rect;
        private Rect tooltipTrigger;
        private string tooltipText;
        private bool disableExpandCollapse;
        private bool disableSelection;

        public ButtonPanel(string[] selectionTexts) {
            this.selectionTexts = selectionTexts;
            GroupOffset = 0.5f * Line.IconDimension.x;
        }

        public void Initialize() {
            var cellWidths = selectionTexts
                .Select(name => ViewStyles.SelectionButton.CalcSize(new GUIContent(name)).x);
            selectionButtonWidth = Mathf.Max(cellWidths.ToArray()) * selectionTexts.Count();

            minimalHeight = ViewStyles.SelectionButton.CalcSize(ViewStyles.DummyContent).y;
            tooltip = new Tooltip(new Vector2(0, minimalHeight + 1));
            buildButtonWidth = GUI.skin.button.CalcSize(new GUIContent(BuildButtonText)).x;

            CalcButtonRects();
            isInitialized = true;
        }

        public void SetDisabledStatus(bool disableSelection, bool disableExpandCollapse) {
            this.disableSelection = disableSelection;
            this.disableExpandCollapse = disableExpandCollapse;
        }

        public int Draw(Rect rect, int selectedViewId) {
            tooltip.Clear();

            this.rect = rect;

            GUI.BeginGroup(rect);
            int viewId = DrawViewSelection(selectedViewId, disableSelection);
            DrawExpandAndCollapseButtons(disableExpandCollapse);
            DrawBuildButton();
            GUI.EndGroup();

            return viewId;
        }

        public void DrawTooltip() {
            var tooltipRect = new Rect(tooltipTrigger.position + rect.position, tooltipTrigger.size);
            tooltip.Draw(tooltipRect, tooltipText);
        }

        public float GetMinimalWidth() {
            CheckForInitialization();
            return expandRect.xMax + GroupOffset + buildButtonWidth;
        }

        public float GetMinimalHeight() {
            CheckForInitialization();
            return minimalHeight;
        }

        private void CalcButtonRects() {
            selectionRect = new Rect(Vector2.zero, new Vector2(selectionButtonWidth, minimalHeight));
            var size = new Vector2(GUI.skin.button.CalcSize(ViewStyles.CollapseContent).x, minimalHeight);
            collapseRect = GuiUtils.GetRectOnRightHandSide(selectionRect, size, GroupOffset);
            expandRect = GuiUtils.GetRectOnRightHandSide(collapseRect, size, 0.25f * GroupOffset);
        }

        private int DrawViewSelection(int selectedViewId, bool isDisabled) {
            EditorGUI.BeginDisabledGroup(isDisabled);
            int viewId = GUI.SelectionGrid(selectionRect, selectedViewId, selectionTexts,
                selectionTexts.Length, ViewStyles.SelectionButton);
            EditorGUI.EndDisabledGroup();

            return viewId;
        }

        private void DrawExpandAndCollapseButtons(bool isDisabled) {
            EditorGUI.BeginDisabledGroup(isDisabled);
            HasCollapseCommand = DrawButton(collapseRect, ViewStyles.CollapseContent, CollapseTooltipText);
            HasExpandCommand = DrawButton(expandRect, ViewStyles.ExpandContent, ExpandTooltipText);
            EditorGUI.EndDisabledGroup();
        }

        private bool DrawButton(Rect buttonRect, GUIContent content, string description) {
            if (buttonRect.Contains(Event.current.mousePosition)) {
                tooltipTrigger = buttonRect;
                tooltipText = description;
            }
            return GuiUtils.ColoredContentButton(buttonRect, content, ViewStyles.IconColor);
        }

        private void DrawBuildButton() {
            var buildButtonRect = GuiUtils.GetChildRectAlignedToRight(rect, buildButtonWidth);
            if (GUI.Button(buildButtonRect, BuildButtonText)) {
                EditorWindow.GetWindow(Type.GetType("UnityEditor.BuildPlayerWindow,UnityEditor"));
            }
        }

        private void CheckForInitialization() {
            if (!isInitialized) {
                const string exceptionMessage = "ButtonPanel: can't calculate size before initialization";
                throw new InvalidOperationException(exceptionMessage);
            }
        }
    }
}
