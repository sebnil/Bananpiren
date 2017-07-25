// Copyright 2016 Spin AG. For support contact assets@spin.de

using UnityEditor;
using UnityEngine;

namespace Spin.Assetinator {

    public class AssetinatorWindow : EditorWindow {

        public const string AppLabel = "Assetinator";
        public const string Shortcut = "%&a"; // CMD/CTRL + ALT + A

        private const string ErrorMessage = "Your platform is not supported at the moment";
        private const float MinSizeFactor = 0.25f;

        private static readonly Vector2 UnityDefaultWindowMinSize = new Vector2(100f, 100f);

        private WindowContent content;
        private AssetinatorInstance assetinator;

        private AssetTree idleAssets;
        private TempSettings tempSettings;

        private bool isInitialized;
        private bool hadMouseOver;
        private bool wasDisabled;

        // forces repaint, after first repaint, because ScrollView needs two Repaints to show lines.
        private bool isInitialRepaint;

        [MenuItem("Window/" + AppLabel + " " + Shortcut)]
        private static void ShowWindow() {
            var window = AssetinatorWindow.GetInstanceAndFocus();
            if (window.minSize == UnityDefaultWindowMinSize) {
                var size = new Vector2(Screen.currentResolution.width, Screen.currentResolution.height);
                window.minSize = size * MinSizeFactor;
            }
        }

        public void PrepareInitialize(AssetTree idleAssets, TempSettings tempSettings) {
            isInitialized = false;
            this.idleAssets = idleAssets;
            this.tempSettings = tempSettings;
        }

        private void Initialize() {
            if (isInitialized) {
                return;
            }

            assetinator = AssetinatorInstance.Get(this);
            InitializeContent();
            isInitialized = true;
        }

        private void InitializeContent() {
            isInitialRepaint = true;
            content = new WindowContent(idleAssets, tempSettings);
            tempSettings.TriggerWarnings();
            ViewStyles.Initialize();

            content.Initialize();
            minSize = new Vector2(content.GetMinimalWidth(), minSize.y);
            titleContent = new GUIContent(AppLabel, GuiUtils.LoadIcon("TabIcon.png"));
        }

        public static bool IsDisabled() {
            return EditorApplication.isCompiling || BuildPipeline.isBuildingPlayer;
        }

        public static EditorWindow GetInstanceAndFocus() {
            return EditorWindow.GetWindow(typeof(AssetinatorWindow), false, AppLabel, true);
        }

        public void OnBuildFinished() {
            if (!isInitialized) {
                return;
            }

            tempSettings.TriggerWarnings();
        }

        private void OnEnable() {
            isInitialized = false;
        }

        private void OnGUI() {
            Initialize();

            if (PlatformSettings.IsPlatformSupported) {
                content.Draw(position.width);
            } else {
                GUILayout.Label(ErrorMessage);
            }

            // Force Repaint after InitialRepaint for ScrollView.
            // Doing it here, because the setting of flag has to be done in repaint event
            // and OnInspectorUpdate gets no events
            if (isInitialRepaint && (Event.current.type == EventType.Repaint)) {
                Repaint();
                isInitialRepaint = false;
            }
        }

        private void OnInspectorUpdate() {
            // force repaint manually to display hidden ignorebutton faster || hide ignorebutton if
            // mouse leaves assetinator window
            bool hasMouseOver = (mouseOverWindow == this);

            if (hasMouseOver || hadMouseOver) {
                Repaint();
                hadMouseOver = hasMouseOver;
            }
        }

        private void Update() {
            RepaintOnDisabledStateChange();
        }

        private void OnProjectChange() {
            if (assetinator == null) {
                return;
            }

            assetinator.HandleProjectChange();
            Repaint();
        }

        private void RepaintOnDisabledStateChange() {
            // Repaint, so window is enabled and disabled without having mouse over window
            if (wasDisabled != IsDisabled()) {
                Repaint();
            }

            wasDisabled = IsDisabled();
        }
    }
}
