// Copyright 2016 Spin AG. For support contact assets@spin.de

using UnityEditor;
using UnityEngine;

namespace Spin.Assetinator {

    public class ScrollView {
        private Vector2 scrollingPosition;
        private Rect scrollingRect;
        private int currentLine;
        private int bottomHiddenLines;
        private int firstVisibleLine;
        private int lastVisibleLine;

        public void Initialize() {
            scrollingPosition = Vector2.zero;
        }

        public void Begin() {
            currentLine = 0;
            bottomHiddenLines = 0;

            scrollingPosition = EditorGUILayout.BeginScrollView(scrollingPosition, ViewStyles.ScrollView);
            CalcBorders();

            GUILayout.Space(firstVisibleLine * Line.Height);
        }

        public void End() {
            GUILayout.Space(bottomHiddenLines * Line.Height);
            EditorGUILayout.EndScrollView();
            AdjustScrollingPosition();
            SetScrollingRectForNextLayout();
        }

        public void Display(Line line, float indentation, bool showIgnored) {
            if (currentLine >= firstVisibleLine && currentLine <= lastVisibleLine) {
                line.Draw(indentation, showIgnored);
            } else if (currentLine > lastVisibleLine) {
                bottomHiddenLines++;
            } else {
                // do nothing
            }

            currentLine++;
        }

        private void CalcBorders() {
            // Don't calc in repaint, because scrollingPosition is changing from layout to repaint
            // event, e.g. if you collapse a line near list end. Unity then wants to display an empty
            // space at end and gets an ArgumentException.

            if (Event.current.type == EventType.Layout) {
                float firstHiddenBottomPixel = scrollingPosition.y + scrollingRect.height;
                float lastVisibleBottomPixel = firstHiddenBottomPixel - 1;

                firstVisibleLine = YCoordinateToLine(scrollingPosition.y);
                lastVisibleLine = YCoordinateToLine(lastVisibleBottomPixel);
            }
        }

        private static int YCoordinateToLine(float yCoordinate) {
            return Mathf.FloorToInt(yCoordinate / Line.Height);
        }

        private void AdjustScrollingPosition() {
            if (scrollingPosition.y > currentLine * Line.Height) {
                scrollingPosition.y = 0;
            }
        }

        private void SetScrollingRectForNextLayout() {
            // GetLastRect only works in repaint event
            if (Event.current.type == EventType.Repaint) {
                scrollingRect = GUILayoutUtility.GetLastRect();
            }
        }
    }
}
