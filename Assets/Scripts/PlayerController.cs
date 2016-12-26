using UnityEngine;
using System.Collections;
using CnControls;

public class PlayerController : MonoBehaviour {

    public float speed;
    private Rigidbody rb;
    public ParticleEmitter boatWakeParticles;
	public bool isInUnloadingZone = false;



    // Use this for initialization
    void Start () {
        rb = GetComponent<Rigidbody>();
    }
	
	// Update is called once per frame
	void Update () {
		float moveHorizontal;
		switch (GUIHandler.Instance.controlInput) {

		case ControlInput.HUD:
			moveHorizontal = CnInputManager.GetAxis("Horizontal");
			break;
		case ControlInput.Accelerometer:
			moveHorizontal = Input.acceleration.x;
			break;
		case ControlInput.Keyboard:
		default:
			moveHorizontal = Input.GetAxis ("Horizontal");
			break;
		}
			
        Vector3 movement = new Vector3(moveHorizontal, 0.0f, 0.0f);

        rb.AddForce(movement * speed);

        if (moveHorizontal != 0)
        {
            boatWakeParticles.emit = true;
        }
        else
        {
            boatWakeParticles.emit = false;
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
