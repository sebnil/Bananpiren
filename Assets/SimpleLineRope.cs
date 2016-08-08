using UnityEngine;
using System.Collections;

public class SimpleLineRope : MonoBehaviour {
	float startWidth = 0.2f;
	float endWidth = 0.2f;
	public Material aMaterial;

	private LineRenderer line;

	public Vector3 point01 = new Vector3(0,0,0);
	public Vector3 point02 = new Vector3(2,1,0);

	private Crane craneScript;

	// Use this for initialization
	void Start () {
		craneScript = gameObject.GetComponent<Crane> ();

		line = gameObject.AddComponent<LineRenderer>() as LineRenderer;
		line.SetWidth(startWidth, endWidth);
		line.SetVertexCount(2);
		line.material = aMaterial;
		//line.renderer.enabled = true;
	}
	
	// Update is called once per frame
	void Update () {
		if (craneScript.jointConnected) {
			line.SetPosition (0, gameObject.transform.position);
			line.SetPosition (1, craneScript.crateTr.position);
		} else {
			line.SetPosition (0, gameObject.transform.position);
			line.SetPosition (1, gameObject.transform.position + new Vector3(0, -4f, 0));
		}
	}
}
