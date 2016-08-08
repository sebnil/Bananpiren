using UnityEngine;
using System.Collections;

public class Crate : MonoBehaviour {

    private Rigidbody rb;
    private Transform tr;
    private Renderer renderer;

	private PlayerController playerController;
	private GameController gameController;
    public Rigidbody boatRigidBody;

	public bool onCrane = false;

    public bool onBoat = false;
    public bool inCargoZone = false;
    public float relativeVelocityMagnitude;

    public Material crateOnBoatMaterial;
    public Material crateNotOnBoatMaterial;

    public GameObject splashPrefab;
    public GameObject surfaceSplashPrefab;

	public GameObject crateDeliveredTextPrefab;

    // Use this for initialization
    void Start () {
        rb = GetComponent<Rigidbody>();
        tr = GetComponent<Transform>();
        renderer = GetComponent<Renderer>();

        boatRigidBody = GameObject.FindWithTag("Player").GetComponent<Rigidbody>();
		playerController = GameObject.FindWithTag("Player").GetComponent<PlayerController>();
		gameController = GameObject.FindWithTag ("GameController").GetComponent<GameController> ();
    }
	
	// Update is called once per frame
	void Update () {
        onBoat = OnBoat();
        
        if (onBoat)
        {
            renderer.material = crateOnBoatMaterial;

			if (playerController.isInUnloadingZone) {
				gameController.IncrementNumberOfCratesDelivered ();
				Destroy (this.gameObject);
				Instantiate(crateDeliveredTextPrefab, transform.position, transform.rotation);
			}
        }
        else
        {
            renderer.material = crateNotOnBoatMaterial;
        }
	}

    void OnTriggerEnter(Collider other)
    {
        if (other.tag == "CargoTriggerBox")
        {
            inCargoZone = true;
        }
        else if (other.tag == "WaterPlane" && !onBoat && !inCargoZone)
        {
            Instantiate(splashPrefab, new Vector3(transform.position.x, -1, transform.position.z), Quaternion.identity);
            Instantiate(surfaceSplashPrefab, new Vector3(transform.position.x, 0, transform.position.z), Quaternion.identity);

            /*var opposite = -rb.velocity;
            var brakePower = 1000;
            var brakeForce = opposite.normalized * brakePower;
            rb.AddForce(brakeForce);*/
            double ySpeed = rb.velocity.y * 0.1f;
            rb.velocity = new Vector3(rb.velocity.x, (float)ySpeed, rb.velocity.z);
            //rb.AddTorque(new Vector3(5f, 5f, -500f));
            //rb.AddRelativeTorque(new Vector3(0, 0, -5000f));
        }
    }
    void OnTriggerExit(Collider other)
    {
        if (other.tag == "CargoTriggerBox")
        {
            inCargoZone = false;
        }
    }

    private bool OnBoat()
    {
        Vector3 pos = tr.transform.position;
        Vector3 vel = rb.velocity;
        Vector3 boatVelocity = boatRigidBody.velocity;
        relativeVelocityMagnitude = (vel - boatVelocity).magnitude;

        if (!inCargoZone)
        {
            // not in cargo zone
            return false;
        }

        /*if (pos.y < 0)
        {
            // under water
            return false;
        }

        if (Mathf.Abs(pos.x) > 14)
        {
            // on dock
            return false;
        }*/

        if (relativeVelocityMagnitude > 0.8)
        {
            // moving too much compared to boat
            return false;
        }

        return true;
    }
}
