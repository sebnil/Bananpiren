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
	public AudioClip[] boatSound;
	public float[] boatSoundThresholds;

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
		/*if (Mathf.Abs(rb.velocity.x) > boatSoundThresholds [0]) 
		{
			audioSource.clip = boatSound [0];
			audioSource.mute = false;
		} 
		else if (Mathf.Abs(rb.velocity.x) > boatSoundThresholds [1]) 
		{
			audioSource.clip = boatSound [1];
			audioSource.mute = false;
		} 
		else 
		{
			//audioSource.mute = true;
		}*/

		float pitch = Mathf.Clamp(Mathf.Abs (rb.velocity.x) * 0.2f, 1, 2);
		audioSource.pitch = pitch;

		if (!audioSource.isPlaying) {
			audioSource.Play ();
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
