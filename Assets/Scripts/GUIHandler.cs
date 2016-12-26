using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using System.Collections.Generic;

public enum ControlInput {Keyboard, HUD, Accelerometer};

public class GUIHandler : Singleton<GUIHandler> {
	
	public List<string> inputMethods = new List<string> ();

	public Dropdown inputMethodDropdown;
	public GameObject touchController;

	public ControlInput controlInput = ControlInput.Keyboard;

	// Use this for initialization
	void Start ()
	{
		populateDropdownList ();
		inputMethodDropdown.value = GetSelectedIndexFromPreferences();

		updateControlInput ();
		updateVisibleControls ();
	}

	void populateDropdownList ()
	{
		inputMethods = new List<string> () { "HUD" };
		if (isEditor() || isMobile ()) {
			inputMethods.Add ("Accelerometer");
		} 

		if(isEditor() || !isMobile()) {
			inputMethods.Add ("Keyboard");
		}
		inputMethods.Sort ();
		inputMethodDropdown.AddOptions (inputMethods);
	}

	public void ControlMethodDropdownValueChanged (int index)
	{
		Debug.Log ("selected: " + inputMethods[index]);
		PlayerPrefs.SetInt("InputMethod", index);
		updateControlInput ();
		updateVisibleControls ();
	}

	int GetSelectedIndexFromPreferences() {
		int inputMethodFromPrefs = PlayerPrefs.GetInt("InputMethod");
		if (inputMethodFromPrefs <= inputMethods.Count) {
			return inputMethodFromPrefs;
		}
		else {
			return 0;
		}
	}

	public ControlInput GetPlayerControlInput() {
		int inputMethodFromPrefs = GetSelectedIndexFromPreferences ();
		string inputMethodAsString = inputMethods [inputMethodFromPrefs];
		if (inputMethodAsString == "Keyboard") {
			return ControlInput.Keyboard;
		} else if (inputMethodAsString == "Accelerometer") {
			return ControlInput.Accelerometer;
		} else {
			return ControlInput.HUD;
		}
	}

	private void updateControlInput() {
		controlInput = GetPlayerControlInput ();
	}

	private void updateVisibleControls() {
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
}
