using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GUIMusicToggleStyling : MonoBehaviour {

	// Use this for initialization
	void Start () {
        Toggle toggle = GetComponent<Toggle>();
        toggle.isOn = GUIHandler.Instance.GetMusicPreference();
    }

    void OnGUI()
    {


    }
}
