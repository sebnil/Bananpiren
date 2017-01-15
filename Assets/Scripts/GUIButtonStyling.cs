using UnityEngine;  
using System.Collections;  
using UnityEngine.EventSystems;  
using UnityEngine.UI;

public class GUIButtonStyling : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler {

	public Text theText;
	public Button button;
	public bool isActive = false;
	private bool needRefresh = false;
	public Color color = Color.white;
	public GameState previousGameState = GameState.Running;

	public void Start() {
		button = this.GetComponent<Button>();
		theText = (Text)button.GetComponentInChildren<Text>();
	}

	public void OnPointerEnter(PointerEventData eventData)
	{
		if (isActive) {
			color = Color.red;
		} else {
			color = Color.yellow;
		}
	}

	public void OnPointerExit(PointerEventData eventData)
	{
		if (isActive) {
			color = Color.red;
		} else {
			color = Color.white;
		}
	}

	public void OnDisable() {
		if (isActive) {
			color = Color.red;
		} else {
			color = Color.white;
		}
	}


	public void Update ()
	{
		if (GameController.Instance.gameState != GameState.Running) {
			//RefreshColor ();
			theText.color = color;
		}
	}

	public void SetSelected(bool value) {
		isActive = value;
		if (isActive) {
			color = Color.red;
		} else {
			color = Color.white;
		}
	}


	public void RefreshColor() {
		if (theText == null) {
			needRefresh = true;
			return;
		}
			
		needRefresh = false;
	}
}