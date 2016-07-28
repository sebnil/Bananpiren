using UnityEngine;
using System.Collections;

public class CrateDebugTextController : MonoBehaviour {

    public GameObject crate;
    public TextMesh text;
    private Crate crateScript;

    // Use this for initialization
    void Start () {
        crateScript = crate.GetComponent<Crate>();
        text = GetComponent<TextMesh>();
    }
	
	// Update is called once per frame
	void Update () {
        if (crateScript.onBoat)
        {
            text.text = "1";
        }
        else
        {
            text.text = "0";
        }

        text.text = text.text + "\n" + crateScript.relativeVelocityMagnitude.ToString("F2");

    }
}
