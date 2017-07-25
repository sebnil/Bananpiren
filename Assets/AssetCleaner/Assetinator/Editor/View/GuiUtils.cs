// Copyright 2016 Spin AG. For support contact assets@spin.de

using UnityEditor;
using UnityEngine;

namespace Spin.Assetinator {

    public static class GuiUtils {

        private static string iconPath;

        public static float MinimalWidth(string stylename, GUIContent content) {
            return new GUIStyle(stylename).CalcSize(content).x;
        }

        public static Texture2D LoadIcon(string iconName) {
            string fullIconPath = iconPath + iconName;
            return AssetDatabase.LoadAssetAtPath<Texture2D>(fullIconPath);
        }

        public static void SetIconPath(string assetinatorPath) {
            iconPath = assetinatorPath + "/View/Icons/";
        }

        public static Rect GetChildRectAlignedToRight(Rect containerRect, float width) {
            var position = new Vector2(containerRect.width - width, 0);
            var size = new Vector2(width, containerRect.height);
            return new Rect(position, size);
        }

        public static Rect GetRectOnRightHandSide(Rect leftRect, Vector2 size, float xOffset = 0) {
            return new Rect(leftRect.xMax + xOffset, leftRect.y, size.x, size.y);
        }

        public static bool ColoredContentButton(Rect rect, GUIContent content, Color color) {
            Color oldColor = GUI.contentColor;
            GUI.contentColor = color;
            bool result = GUI.Button(rect, content);
            GUI.contentColor = oldColor;
            return result;
        }
    }
}
