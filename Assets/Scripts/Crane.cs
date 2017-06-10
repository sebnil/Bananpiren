using UnityEngine;
using System.Collections;


[RequireComponent(typeof(AudioSource))]
public class Crane : MonoBehaviour {

	public Rigidbody crateRb;
	public Transform crateTr;
	public GameObject cratePrefab;
	private float originalCrateRbMass;
    private float originalCrateRbDrag;
    private float originalCrateRbAngularDrag;
    public float onCraneCrateRbMass;

	private HingeJoint hingejoint;
	private Rigidbody rb;
	private Transform tr;
    private float currentDirection = 1;
    public float swingTurnAngle;
    public float swingAbsTargetVelocity;
    public float swingForce;
    public float swingXVelocityFactorOnRelease;


    public bool jointConnected = false;

	enum PositionState {Up, MovingDown, Down, MovingUp};
	PositionState positionState = PositionState.Up;
	private Vector3 kinematicVelocity = new Vector3();
	public float craneMinYLift;
	public float craneMaxYLift;
	public float craneLiftAbsSpeed;

	AudioSource audioSource;

    public bool PlayerHasDropedAtLeastOneCrate = false;

    // Use this for initialization
    void Start () {
		hingejoint = GetComponent<HingeJoint> ();
		rb = GetComponent<Rigidbody> ();
		tr = GetComponent<Transform> ();
		audioSource = GetComponent<AudioSource>();

		InstantiateNewCrate ();
	}

	private void InstantiateNewCrate() {
		GameObject obj = Instantiate(cratePrefab, new Vector3(transform.position.x, transform.position.y - 8, transform.position.z), Quaternion.identity) as GameObject;
		crateRb = obj.GetComponent<Rigidbody> ();
		originalCrateRbMass = crateRb.mass;
        originalCrateRbDrag = crateRb.drag;
        originalCrateRbAngularDrag = crateRb.angularDrag;
        crateTr = obj.GetComponent<Transform> ();
		positionState = PositionState.MovingDown;

		hingejoint.connectedBody = crateRb;
		jointConnected = true;
	}
	
	// Update is called once per frame
	void Update () {

	}

	public void LetGoOfCrate() {
        PlayerHasDropedAtLeastOneCrate = true;

        hingejoint.connectedBody = null;
		crateRb.mass = originalCrateRbMass;
        crateRb.drag = originalCrateRbDrag;
        crateRb.angularDrag = originalCrateRbAngularDrag;
        float speedX = crateRb.velocity.x * swingXVelocityFactorOnRelease;
        crateRb.velocity = new Vector3(speedX, crateRb.velocity.y, crateRb.velocity.z);
        crateRb = null;
		jointConnected = false;
		positionState = PositionState.MovingUp;
		audioSource.Play();
	}

	void FixedUpdate() 
	{
		if (positionState != PositionState.MovingUp && tr.position.y <= craneMinYLift) {
			positionState = PositionState.Down;
		} else if (positionState != PositionState.MovingDown && tr.position.y >= craneMaxYLift) {
			positionState = PositionState.Up;
		}

		switch (positionState) {
			case PositionState.Up:
			case PositionState.Down:
				kinematicVelocity = Vector3.zero;
				break;
			case PositionState.MovingDown:
				kinematicVelocity = -transform.up * craneLiftAbsSpeed;
				break;
			case PositionState.MovingUp:
				kinematicVelocity = transform.up * craneLiftAbsSpeed;
				break;
		}

		if (positionState == PositionState.Up && crateRb == null) {
			InstantiateNewCrate ();
		}


		rb.MovePosition(transform.position + kinematicVelocity * Time.deltaTime);

		if (crateRb != null) {
			crateRb.mass = onCraneCrateRbMass;
            crateRb.drag = 0;
            crateRb.angularDrag = 0;

            if (currentDirection == 1 && hingejoint.angle > swingTurnAngle)
            {
                currentDirection = -1;
            }
            else if (currentDirection == -1 && hingejoint.angle < -swingTurnAngle)
            {
                currentDirection = 1;
            }

            JointMotor motor = hingejoint.motor;
            motor.force = swingForce;
            motor.targetVelocity = currentDirection * swingAbsTargetVelocity;
            motor.freeSpin = false;
            hingejoint.motor = motor;
            hingejoint.useMotor = true;

            //Debug.Log(hingejoint.angle);
        }
	}
}
