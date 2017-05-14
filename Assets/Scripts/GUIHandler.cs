using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using System.Collections.Generic;
using com.kleberswf.lib.core;

public enum ControlInput {Keyboard, HUD, Accelerometer};

public class GUIHandler : Singleton<GUIHandler> {

	// HUD controller (only visible for ControlInput.HUD)
	public GameObject touchController;

	// selected control
	public ControlInput controlInput = ControlInput.Keyboard;
	private int possibleInputCount;

	// buttons
	public Button KeyboardButton;
	public Button HUDButton;
	public Button AccelerometerButton;

	//public Button ResumeButton;


	// Use this for initialization
	void Start ()
	{
		updateVisibleGUIElements();
		updateControlInput ();


		updateButton ();
		updateVisibleHUDControls ();
	}

	// positions buttons and hids them if necessary
	void updateVisibleGUIElements() {
		possibleInputCount = 1;


		if (isEditor () || isMobile ()) {
			AccelerometerButton.gameObject.SetActive (true);
			possibleInputCount++;
		} else {
			AccelerometerButton.gameObject.SetActive (false);
		}

		if (isEditor () || !isMobile ()) {
			KeyboardButton.gameObject.SetActive (true);
			possibleInputCount++;
		} else {
			KeyboardButton.gameObject.SetActive (false);
		}

		const float center = 0f;
		const float leftTwoElements = -140f;
		const float rightTwoElements = 140f;
		const float leftThreeElements = -190f;
		const float rightThreeElements = 190f;

		const float yPosition = 13f;

		switch (possibleInputCount) {
		case 1:
			if (KeyboardButton.gameObject.activeSelf) {
				KeyboardButton.gameObject.transform.localPosition = new Vector3 (center, yPosition, 0f);
			}
			if (HUDButton.gameObject.activeSelf) {
				HUDButton.gameObject.transform.localPosition = new Vector3 (center, yPosition, 0f);
			}
			if (AccelerometerButton.gameObject.activeSelf) {
				AccelerometerButton.gameObject.transform.localPosition = new Vector3 (center, yPosition, 0f);
			}
			break;
		case 2:
			float nextPosition = leftTwoElements;
			if (KeyboardButton.gameObject.activeSelf) {
				KeyboardButton.gameObject.transform.localPosition = new Vector3 (nextPosition, yPosition, 0f);
				nextPosition = rightTwoElements;
			}
			if (HUDButton.gameObject.activeSelf) {
				HUDButton.gameObject.transform.localPosition = new Vector3 (nextPosition, yPosition, 0f);
				nextPosition = rightTwoElements;
			}
			if (AccelerometerButton.gameObject.activeSelf) {
				AccelerometerButton.gameObject.transform.localPosition = new Vector3 (nextPosition, yPosition, 0f);
			}
			break;
		case 3:
		default:
			KeyboardButton.gameObject.transform.localPosition = new Vector3 (leftThreeElements, yPosition, 0f);
			HUDButton.gameObject.transform.localPosition = new Vector3 (center, yPosition, 0f);
			AccelerometerButton.gameObject.transform.localPosition = new Vector3 (rightThreeElements, yPosition, 0f);

			break;
		}
	}

	int GetSelectedIndexFromPreferences() {
		int inputMethodFromPrefs = PlayerPrefs.GetInt("InputMethod");
		if (inputMethodFromPrefs <= possibleInputCount) {
			return inputMethodFromPrefs;
		}
		else {
			return 0;
		}
	}

	void SetSelectedIndexFromPreferences() {
		Debug.Log ("SetSelectedIndexFromPreferences: " + controlInput);
		PlayerPrefs.SetInt("InputMethod", (int)controlInput);
	}

	public ControlInput GetPlayerControlInput() {
		
		int inputMethodFromPrefs = GetSelectedIndexFromPreferences ();
		Debug.Log ("GetPlayerControlInput:" + inputMethodFromPrefs);
		ControlInput controlInput = (ControlInput)inputMethodFromPrefs;

		if (!hasKeyboard() && controlInput == ControlInput.Keyboard) {
			controlInput = ControlInput.HUD;
		}

		return controlInput;
	}

	public void SetPlayerControlInput(int ci) {
		controlInput = (ControlInput)ci;
		SetSelectedIndexFromPreferences ();
		updateVisibleHUDControls ();
		updateButton ();
	}

    public void SetMusicPreference(bool enabled)
    {
        Debug.Log("SetMusicPreference: " + enabled);
        PlayerPrefs.SetInt("MusicEnabled", enabled ? 1 : 0);
    }

    public bool GetMusicPreference()
    {
        return PlayerPrefs.GetInt("MusicEnabled", 1) == 1 ? true : false;
    }

    public void updateButton() {
		KeyboardButton.GetComponent<GUIButtonStyling> ().SetSelected (false);
		HUDButton.GetComponent<GUIButtonStyling> ().SetSelected (false);
		AccelerometerButton.GetComponent<GUIButtonStyling> ().SetSelected (false);

		switch (controlInput) {
		case ControlInput.Keyboard:
			KeyboardButton.GetComponent<GUIButtonStyling> ().SetSelected (true);
			break;
		case ControlInput.HUD:
			HUDButton.GetComponent<GUIButtonStyling> ().SetSelected (true);
			break;
		case ControlInput.Accelerometer:
			AccelerometerButton.GetComponent<GUIButtonStyling> ().SetSelected (true);
			break;
		}
	}

	private void updateControlInput() {
		controlInput = GetPlayerControlInput ();
	}

	private void updateVisibleHUDControls() {
		Debug.Log ("updateVisibleControls");
		// only show touch buttons if HUD is selected as control method
		if (controlInput == ControlInput.HUD) {
			touchController.SetActive (true);
		} else {
			touchController.SetActive (false);
		}
	}

	bool isEditor() {
		#if UNITY_EDITOR
		return true;
		#else
		return false;
		#endif
	}

	bool isMobile ()
	{
#if UNITY_ANDROID
		return true;
#elif UNITY_IPHONE
		return true;
#else
		return false;
#endif
	}

	bool hasKeyboard() 
	{
		if (isMobile())
		{
			return false;
		}
		else {
			return false;
		}
	}
}
