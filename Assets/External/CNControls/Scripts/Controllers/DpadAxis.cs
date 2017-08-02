using UnityEngine;
using UnityEngine.UI;

namespace CnControls
{
    public class DpadAxis : MonoBehaviour
    {
        public string AxisName;
        public float AxisMultiplier;

        public RectTransform RectTransform { get; private set; }
        public int LastFingerId { get; set; }
        private VirtualAxis _virtualAxis;
        Image image;

        private void Awake()
        {
            RectTransform = GetComponent<RectTransform>();
             image = GetComponent<Image>();
        }

        private void OnEnable()
        {
            _virtualAxis = _virtualAxis ?? new VirtualAxis(AxisName);
            LastFingerId = -1;

            CnInputManager.RegisterVirtualAxis(_virtualAxis);
        }

        private void OnDisable()
        {
            CnInputManager.UnregisterVirtualAxis(_virtualAxis);
        }

        public void Press(Vector2 screenPoint, Camera eventCamera, int pointerId)
        {
            _virtualAxis.Value = Mathf.Clamp(AxisMultiplier, -1f, 1f);
            LastFingerId = pointerId;
            image.color = Color.gray;
        }

        public void TryRelease(int pointerId)
        {
            if (LastFingerId == pointerId)
            {
                _virtualAxis.Value = 0f;
                LastFingerId = -1;
            }
            image.color = Color.white;
        }
    }
}