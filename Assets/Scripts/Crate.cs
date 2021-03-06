﻿using UnityEngine;

public class Crate : MonoBehaviour
{

	private Rigidbody rb;
	private Transform tr;
	private Renderer renderer;


	private PlayerController playerController;
	public Rigidbody boatRigidBody;

    public float relativeVelocityMagnitude;

	public bool onCrane = false;

    public bool inFasteningZone = false;
	public bool onBoat = false;
	public bool inCargoZone = false;
	public bool inUnloadZone = false;

    public bool fixedJointCreated = false;

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

    float fastenerPercentDone = 0f;


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

	GameObject fastenerCosmetics;

    public GameObject bananaSwitchesStateParticleSystem;
    private Color brownColor = new Color(170/255f, 104/255f, 49/255f, 1);

    SpringJoint crateFixedJointToBoat;

    // Use this for initialization
    void Start ()
	{
		rb = GetComponent<Rigidbody> ();
		tr = GetComponent<Transform> ();
		renderer = GetComponent<Renderer> ();
		audioSource = GetComponent<AudioSource> ();
        crateFixedJointToBoat = GetComponent<SpringJoint>();

		fastenerCosmetics = gameObject.transform.Find ("CrateFastenerCosmetics").gameObject;
		boatRigidBody = GameObject.FindWithTag ("Player").GetComponent<Rigidbody> ();
		playerController = GameObject.FindWithTag ("Player").GetComponent<PlayerController> ();

		timeRemaining = GameController.Instance.crateTimers.timerStart;
		InvokeRepeating ("decreaseTimeRemaining", 1.0f, 1.0f);

		// set low center of mass to avoid boxes rolling
		//rb.centerOfMass = new Vector3(0f, -0.0f, 0f);
	}
	
	// Update is called once per frame
	void Update ()
	{
		onBoat = OnBoat ();
        
		if (onBoat) {

			if (playerController.isInUnloadingZone) {
				deliverCrateToDock ();
            }
		} 
		else if (inUnloadZone) 
		{
			deliverCrateToDock ();
		}
	}

	private void deliverCrateToDock()
	{
        GameController.Instance.IncrementNumberOfCratesDelivered (crateState);

		// create time bonus text
		GameObject crateDeliveredTextInstance = Instantiate (crateDeliveredTextPrefab, transform.position, transform.rotation) as GameObject;
		TextMesh t = crateDeliveredTextInstance.GetComponent<TextMesh> ();
		float currentTimeBonus = getCurrentTimeBonus();

		// set text
		if (currentTimeBonus > 0) {
			t.text = "+" + getCurrentTimeBonus();
		}
		else
		{
			t.text = "-" + getCurrentTimeBonus();
		}

		// set color and size of text
		switch (crateState)
		{
		case CrateState.Green:
			t.fontSize = 19;
			t.color = Color.green;
			break;
		case CrateState.Yellow:
			t.fontSize = 50;
			t.color = Color.yellow;
			break;
		case CrateState.Brown:
			t.fontSize = 19;
			t.color = new Color32(0x77, 0x37, 0x11, 0xFF);
			break;
		case CrateState.Rotten:
			t.fontSize = 19;
			t.color = Color.red;
			break;
		default:
			t.fontSize = 1;
			t.color = Color.red;
			break;
		}

        Debug.Log(string.Format("Crate::deliverCrateToDock. {0:F0}", currentTimeBonus));

        // destroy this crate
        Destroy(this.gameObject);
	}

    private void FixedUpdate()
    {
		Vector3 pos = tr.transform.position;
		Vector3 vel = rb.velocity;
		Vector3 boatVelocity = boatRigidBody.velocity;
        relativeVelocityMagnitude = (vel - boatVelocity).magnitude;

        // fastener progress
        if (!fixedJointCreated && inFasteningZone && relativeVelocityMagnitude < 3f)
		{
            fastenerPercentDone = Mathf.Clamp(fastenerPercentDone + Time.fixedDeltaTime * 0.5f, 0, 1);
		}
        else if (!fixedJointCreated)
        {
            fastenerPercentDone = 0;
        }
			
        if (fastenerPercentDone >= 1f && !fixedJointCreated)
        {
			gameObject.AddComponent<SpringJoint>();
			gameObject.GetComponent<SpringJoint>().connectedBody = boatRigidBody;
			gameObject.GetComponent<SpringJoint> ().enableCollision = true;
			gameObject.GetComponent<SpringJoint> ().damper = 10;
			gameObject.GetComponent<SpringJoint> ().spring = 100;
			gameObject.GetComponent<SpringJoint> ().breakForce = 30;
            fixedJointCreated = true;
			fastenerCosmetics.gameObject.SetActive (true);
        }
    }

	void OnJointBreak(float breakForce)
	{
		Debug.Log("Crate::OnJointBreak. force: " + breakForce);
		fixedJointCreated = false;
        fastenerPercentDone = 0f;
		fastenerCosmetics.gameObject.SetActive (false);
	}

    void OnTriggerEnter (Collider other)
	{
		if (other.tag == "CargoTriggerBox") 
        {
			inCargoZone = true;
		} 
        
		if (other.tag.Contains("WaterPlane") && !onBoat && !inCargoZone) 
        {
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
				
			// slow down crate on impact
			rb.velocity = new Vector3 ((float)(rb.velocity.x * 0.1), (float)(rb.velocity.y * 0.1f), rb.velocity.z);

			GameController.Instance.PunishForDroppedCrate ();
			showDroppedCrateText (transform.position, transform.rotation);

		}

        if (other.tag == "CargoThatCanBeFastenedTriggerBox")
        {
            inFasteningZone = true;
        }

		if (other.tag.Contains ("UnloadTriggerBox")) 
		{
			inUnloadZone = true;
		}
	}

	void OnTriggerExit (Collider other)
	{
		if (other.tag == "CargoTriggerBox") {
			inCargoZone = false;
		}

		if (other.tag == "CargoThatCanBeFastenedTriggerBox")
		{
            inFasteningZone = false;
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
        timeRemaining = timeRemaining - GameController.Instance.currentRipenFactor;
        CrateState currentState = crateState;
		if (timeRemaining < GameController.Instance.crateTimers.rottenThreshold) {
			renderer.material = crateMaterials.crateRottenBananas;
			crateState = CrateState.Rotten;
		} else if (timeRemaining < GameController.Instance.crateTimers.brownThreshold) {
			renderer.material = crateMaterials.crateBrownBananas;
			crateState = CrateState.Brown;
		} else if (timeRemaining < GameController.Instance.crateTimers.yellowThreshold) {
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
        t.text = "-" + GameController.Instance.crateDroppedTimePunishment.ToString("F0");
	}

	float getCurrentTimeBonus ()
	{
		switch (crateState) {
		case CrateState.Rotten:
			return GameController.Instance.crateTimers.timeBonusRotten;
		case CrateState.Brown:
			return GameController.Instance.crateTimers.timeBonusBrown;
		case CrateState.Yellow:
			return GameController.Instance.crateTimers.timeBonusYellow;
		default:
			return GameController.Instance.crateTimers.timeBonusGreen;
		}
	}
}
