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

	AudioSource audioSource;
	public AudioClip[] crateHitBoat;
	public AudioClip[] crateSplash;
	public float crateHitBoatSoundVelocityThreshold;
	public float[] crateSplashSoundVelocityThreshold;

    // Use this for initialization
    void Start () {
        rb = GetComponent<Rigidbody>();
        tr = GetComponent<Transform>();
        renderer = GetComponent<Renderer>();
		audioSource = GetComponent<AudioSource> ();

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


			Debug.Log ("crate with water with vel: " + rb.velocity.magnitude);
			if (rb.velocity.magnitude > crateSplashSoundVelocityThreshold[0]) {
				audioSource.PlayOneShot (crateSplash [0]);
			} else if (rb.velocity.magnitude > crateSplashSoundVelocityThreshold[1]) {
				audioSource.PlayOneShot (crateSplash [1]);
			} else {
				// play no sound
			}

			double ySpeed = rb.velocity.y * 0.1f;
            rb.velocity = new Vector3(rb.velocity.x, (float)ySpeed, rb.velocity.z);

			gameController.PunishForDroppedCrate ();
        }
    }
    void OnTriggerExit(Collider other)
    {
        if (other.tag == "CargoTriggerBox")
        {
            inCargoZone = false;
        }
    }

	void OnCollisionEnter(Collision collision) {

		Debug.Log ("crate with something hard with rel vel: " + collision.relativeVelocity.magnitude);
		if (collision.relativeVelocity.magnitude > crateHitBoatSoundVelocityThreshold) {
			audioSource.PlayOneShot (crateHitBoat [Random.Range ((int)0, (int)crateHitBoat.Length)]);
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
