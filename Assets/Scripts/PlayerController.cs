using UnityEngine;
using System.Collections;
using CnControls;

public class PlayerController : MonoBehaviour {

    public float speed;
    private Rigidbody rb;
    public ParticleEmitter boatWakeParticles;
	public bool isInUnloadingZone = false;

	public float maxTranslationalVelocity;

    float moveHorizontal;

	AudioSource audioSource;
	public float SoundVelocityThreshold;
	public AudioClip[] CrateHitBoatSounds;

    // Use this for initialization
    void Start () {
        rb = GetComponent<Rigidbody>();
		audioSource = GetComponent<AudioSource> ();
    }
	
	// Update is called once per frame
	void FixedUpdate () {
		// get input
		switch (GUIHandler.Instance.controlInput) {
		    case ControlInput.HUD:
			    moveHorizontal = CnInputManager.GetAxis("Horizontal");
			    break;
		    case ControlInput.Accelerometer:
			    moveHorizontal = Mathf.Clamp(Input.acceleration.x * 5f, -1f, 1f);
			    break;
		    case ControlInput.Keyboard:
		    default:
			    moveHorizontal = Input.GetAxis ("Horizontal");
			    break;
		}
		
        // create movement
        Vector3 movement = new Vector3(moveHorizontal, 0.0f, 0.0f);
        rb.AddForce(movement * speed);

        // clamp velocity
        rb.velocity = Vector3.ClampMagnitude(rb.velocity, maxTranslationalVelocity);
    }

	void Update() {
        // particle effect
        if (moveHorizontal != 0)
        {
            boatWakeParticles.emit = true;
        }
        else
        {
            boatWakeParticles.emit = false;
        }

		// sound
		float pitch = Mathf.Clamp(Mathf.Abs (rb.velocity.x) * 0.2f, 1, 1.5f);
		audioSource.pitch = pitch;
    }

	void OnCollisionEnter (Collision collision)
	{

		//Debug.Log ("crate with something hard with rel vel: " + collision.relativeVelocity.magnitude);
		if (collision.relativeVelocity.magnitude > SoundVelocityThreshold) {
			audioSource.PlayOneShot (CrateHitBoatSounds [Random.Range ((int)0, (int)CrateHitBoatSounds.Length)]);
		}

	}

	void OnTriggerEnter(Collider other)
	{
		if (other.tag == "UnloadTriggerBox")
		{
			isInUnloadingZone = true;
		}
	}

	void OnTriggerExit(Collider other)
	{
		if (other.tag == "UnloadTriggerBox")
		{
			isInUnloadingZone = false;
		}
	}
}
