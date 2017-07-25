// Copyright 2016 Spin AG. For support contact assets@spin.de

using UnityEditor;
using UnityEngine;

namespace Spin.Assetinator {

    public class Tooltip {
        private const double Delay = 1;

        private readonly Vector2 offset;

        private string text;
        private string lastText;
        private double time;
        private Vector2 position;

        private Vector2 oldMousePosition;
        private double lastTime;

        public Tooltip(Vector2 offset) {
            this.offset = offset;
        }

        public void Clear() {
            text = null;
        }

        public void Draw(Rect trigger, string tooltipText, bool hasToWait = false) {
            // Repaint consists of two events: Layout and Repaint.
            // During Layout tooltip is always null, and we can't do anything usefull
            if (Event.current.type == EventType.Layout) {
                return;
            }

            if (trigger.Contains(Event.current.mousePosition)) {
                text = tooltipText;
                float xCoordinate = Mathf.Max(0, trigger.x + offset.x);
                float yCoordinate = Mathf.Max(0, trigger.y + offset.y);
                position = new Vector2(xCoordinate, yCoordinate);
            }

            UpdateTime(hasToWait);
            if (time > Delay) {
                Vector2 size = new GUIStyle("Box").CalcSize(new GUIContent(text));
                var boxRect = new Rect(position, size);
                GUI.Box(boxRect, text, GUI.skin.GetStyle("Tooltip"));
            }
            lastText = text;
        }

        private void UpdateTime(bool hasToWait) {
            double currentTime = EditorApplication.timeSinceStartup;
            Vector2 currentMousePosition = Event.current.mousePosition;

            double deltaTime = currentTime - lastTime;
            bool hasMouseMoved = (currentMousePosition - oldMousePosition).magnitude > 0f;

            lastTime = currentTime;
            oldMousePosition = Event.current.mousePosition;

            if (string.IsNullOrEmpty(text) || !text.Equals(lastText)) {
                time = 0;
                return;
            }

            time += deltaTime;

            // Avoid to fade out tooltip, as long as content doesn't change
            if (time > Delay) {
                return;
            }

            if (hasMouseMoved) {
                time = 0;
                return;
            }

            // time is set to 0,5 as long as tooltip has to wait for another tooltip,
            // so it's displayed a half second after the other tooltip;
            if (hasToWait) {
                time = 0.5;
            }
        }

        public bool HasCountingTimer() {
            return time > 0 && time < Delay;
        }
    }
}
