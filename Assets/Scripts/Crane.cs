using UnityEngine;
using System.Collections;

public class Crane : MonoBehaviour {

	public Rigidbody crateRb;
	public GameObject cratePrefab;

	private SpringJoint springJoint;
	private Rigidbody rb;
	private Transform tr;

	private bool jointConnected = false;

	enum PositionState {Up, MovingDown, Down, MovingUp};
	PositionState positionState = PositionState.Up;
	private Vector3 kinematicVelocity = new Vector3();
	public float craneMinLift;
	public float craneMaxLift;
	public float craneAbsoluteSpeed;
	public float crateSwingXAmplitude;
	public float crateSwingXTimeParam;


	// Use this for initialization
	void Start () {
		springJoint = GetComponent<SpringJoint> ();
		rb = GetComponent<Rigidbody> ();
		tr = GetComponent<Transform> ();


		//StartCoroutine(SwingCrate());
	}

	private void InstantiateNewCrate() {
		GameObject obj = Instantiate(cratePrefab, new Vector3(transform.position.x, transform.position.y - 2, transform.position.z), Quaternion.identity) as GameObject;
		crateRb = obj.GetComponent<Rigidbody> ();
		positionState = PositionState.MovingDown;

		springJoint.connectedBody = crateRb;
		jointConnected = true;
	}
	
	// Update is called once per frame
	void Update () {
		/*if (!jointConnected && crateRb != null) 
		{
			springJoint.connectedBody = crateRb;
			jointConnected = true;
		}*/
			
	}

	public void LetGoOfCrate() {
		springJoint.connectedBody = null;
		crateRb = null;
		jointConnected = false;
		positionState = PositionState.MovingUp;
	}

	void FixedUpdate() 
	{
		if (positionState != PositionState.MovingUp && tr.position.y <= craneMinLift) {
			positionState = PositionState.Down;
		} else if (positionState != PositionState.MovingDown && tr.position.y >= craneMaxLift) {
			positionState = PositionState.Up;
		}

		switch (positionState) {
			case PositionState.Up:
			case PositionState.Down:
				kinematicVelocity = Vector3.zero;
				break;
			case PositionState.MovingDown:
				kinematicVelocity = -transform.up * craneAbsoluteSpeed;
				break;
			case PositionState.MovingUp:
				kinematicVelocity = transform.up * craneAbsoluteSpeed;
				break;
		}

		if (positionState == PositionState.Up && crateRb == null) {
			InstantiateNewCrate ();
		}


		rb.MovePosition(transform.position + kinematicVelocity * Time.deltaTime);

		if (crateRb != null) {
			crateRb.AddForce (new Vector3 (crateSwingXAmplitude * Mathf.Sin ((float)Time.time * crateSwingXTimeParam), 0, 0));
			//crateRb.velocity = new Vector3 (crateSwingXAmplitude * Mathf.Sin ((float)Time.time * crateSwingXTimeParam), 0.1f * Mathf.Cos ((float)Time.time * 0.1f), 0);
		}
	}

	IEnumerator SwingCrate()
	{
		while (true) {
			yield return new WaitForSeconds (Random.Range(0.5f, 2f));
			if (crateRb != null) {
				//crateRb.AddForce (new Vector3 (500f * Mathf.Sin ((float)Time.time * 1f), Random.Range (0f, 100f), 0));
				crateRb.velocity = new Vector3 (crateSwingXAmplitude * Mathf.Sin ((float)Time.time * crateSwingXTimeParam), 0.1f * Mathf.Cos ((float)Time.time * 0.1f), 0);
			}
		}

	}
}
