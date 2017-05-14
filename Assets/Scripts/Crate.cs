using UnityEngine;

public class Crate : MonoBehaviour
{

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

	public float timeRemaining;

	[System.Serializable]
	public class CrateMaterials
	{
		public Material crateGreenBananas;
		public Material crateYellowBananas;
		public Material crateBrownBananas;
		public Material crateRottenBananas;
	}

	public CrateMaterials crateMaterials;

	public enum CrateState
	{
Green,
		Yellow,
		Brown,
		Rotten}

	;

	CrateState crateState = CrateState.Green;

	public GameObject splashPrefab;
	public GameObject surfaceSplashPrefab;

	public GameObject crateDeliveredTextPrefab;
	public GameObject crateDroppedTextPrefab;

	AudioSource audioSource;
	public AudioClip[] crateHitBoat;
	public AudioClip[] crateSplash;
	public float crateHitBoatSoundVelocityThreshold;
	public float[] crateSplashSoundVelocityThreshold;

    public GameObject bananaSwitchesStateParticleSystem;
    private Color brownColor = new Color(170/255f, 104/255f, 49/255f, 1);

    // Use this for initialization
    void Start ()
	{
		rb = GetComponent<Rigidbody> ();
		tr = GetComponent<Transform> ();
		renderer = GetComponent<Renderer> ();
		audioSource = GetComponent<AudioSource> ();

		boatRigidBody = GameObject.FindWithTag ("Player").GetComponent<Rigidbody> ();
		playerController = GameObject.FindWithTag ("Player").GetComponent<PlayerController> ();
		gameController = GameObject.FindWithTag ("GameController").GetComponent<GameController> ();

		timeRemaining = gameController.crateTimers.timerStart;
		InvokeRepeating ("decreaseTimeRemaining", 1.0f, 1.0f);
	}
	
	// Update is called once per frame
	void Update ()
	{
		onBoat = OnBoat ();
        
		if (onBoat) {

			if (playerController.isInUnloadingZone) {
				gameController.IncrementNumberOfCratesDelivered (crateState);
				Destroy (this.gameObject);
				GameObject crateDeliveredTextInstance = Instantiate (crateDeliveredTextPrefab, transform.position, transform.rotation) as GameObject;
				TextMesh t = crateDeliveredTextInstance.GetComponent<TextMesh> ();
                float currentTimeBonus = getCurrentTimeBonus();

                if (currentTimeBonus > 0) {
                    t.text = "+" + getCurrentTimeBonus();
                }
                else
                {
                    t.text = "-" + getCurrentTimeBonus();
                    t.color = Color.red;
                }
                
			}
		} else {
			// do nothing
		}
	}

	void OnTriggerEnter (Collider other)
	{
		if (other.tag == "CargoTriggerBox") {
			inCargoZone = true;
		} else if (other.tag == "WaterPlane" && !onBoat && !inCargoZone) {
			Instantiate (splashPrefab, new Vector3 (transform.position.x, -1, transform.position.z), Quaternion.identity);
			Instantiate (surfaceSplashPrefab, new Vector3 (transform.position.x, 0, transform.position.z), Quaternion.identity);


			Debug.Log ("crate with water with vel: " + rb.velocity.magnitude);
			if (rb.velocity.magnitude > crateSplashSoundVelocityThreshold [0]) {
				audioSource.PlayOneShot (crateSplash [0]);
			} else if (rb.velocity.magnitude > crateSplashSoundVelocityThreshold [1]) {
				audioSource.PlayOneShot (crateSplash [1]);
			} else {
				// play no sound
			}

			double ySpeed = rb.velocity.y * 0.1f;
			rb.velocity = new Vector3 (rb.velocity.x, (float)ySpeed, rb.velocity.z);

			gameController.PunishForDroppedCrate ();
			showDroppedCrateText (transform.position, transform.rotation);

		}
	}

	void OnTriggerExit (Collider other)
	{
		if (other.tag == "CargoTriggerBox") {
			inCargoZone = false;
		}
	}

	void OnCollisionEnter (Collision collision)
	{

		//Debug.Log ("crate with something hard with rel vel: " + collision.relativeVelocity.magnitude);
		if (collision.relativeVelocity.magnitude > crateHitBoatSoundVelocityThreshold) {
			audioSource.PlayOneShot (crateHitBoat [Random.Range ((int)0, (int)crateHitBoat.Length)]);
		}

	}

	private bool OnBoat ()
	{
		Vector3 pos = tr.transform.position;
		Vector3 vel = rb.velocity;
		Vector3 boatVelocity = boatRigidBody.velocity;
		relativeVelocityMagnitude = (vel - boatVelocity).magnitude;

		if (!inCargoZone) {
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

		if (relativeVelocityMagnitude > 0.8) {
			// moving too much compared to boat
			return false;
		}

		return true;
	}

	void decreaseTimeRemaining ()
	{
        timeRemaining = timeRemaining - gameController.currentRipenFactor;
        CrateState currentState = crateState;
		if (timeRemaining < gameController.crateTimers.rottenThreshold) {
			renderer.material = crateMaterials.crateRottenBananas;
			crateState = CrateState.Rotten;
		} else if (timeRemaining < gameController.crateTimers.brownThreshold) {
			renderer.material = crateMaterials.crateBrownBananas;
			crateState = CrateState.Brown;
		} else if (timeRemaining < gameController.crateTimers.yellowThreshold) {
			renderer.material = crateMaterials.crateYellowBananas;
			crateState = CrateState.Yellow;
        } else {
			// default
			renderer.material = crateMaterials.crateGreenBananas;
			crateState = CrateState.Green;
		}

        // if crate state changed
        if (currentState != crateState)
        {
            GameObject obj = Instantiate(bananaSwitchesStateParticleSystem, transform.position, Quaternion.identity) as GameObject;
            ParticleSystem ps = obj.GetComponent<ParticleSystem>();
            switch (crateState)
            {
                case CrateState.Rotten:
                    ps.startColor = Color.black;
                    break;
                case CrateState.Brown:
                    ps.startColor = brownColor;
                    break;
                case CrateState.Yellow:
                    ps.startColor = Color.yellow;
                    break;
                default:
                    // should not happen
                    break;
            }
        }
	}

	void showDroppedCrateText(Vector3 pos, Quaternion rot) {
		GameObject crateDeliveredTextInstance = Instantiate (crateDroppedTextPrefab, pos, rot) as GameObject;
		TextMesh t = crateDeliveredTextInstance.GetComponent<TextMesh> ();
        t.text = "-" + gameController.crateDroppedTimePunishment.ToString("F0");
	}

	float getCurrentTimeBonus ()
	{
		switch (crateState) {
		case CrateState.Rotten:
			return gameController.crateTimers.timeBonusRotten;
			break;
		case CrateState.Brown:
			return gameController.crateTimers.timeBonusBrown;
			break;
		case CrateState.Yellow:
			return gameController.crateTimers.timeBonusYellow;
			break;
		default:
			return gameController.crateTimers.timeBonusGreen;
			break;
		}
	}
}
