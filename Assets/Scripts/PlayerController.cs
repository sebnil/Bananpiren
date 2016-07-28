using UnityEngine;
using System.Collections;
using CnControls;


public class PlayerController : MonoBehaviour {

    public float speed;
    private Rigidbody rb;
    public ParticleEmitter boatWakeParticles;

    // Use this for initialization
    void Start () {
        rb = GetComponent<Rigidbody>();
    }
	
	// Update is called once per frame
	void Update () {
#if UNITY_STANDALONE
        float moveHorizontal = Input.GetAxis("Horizontal");
#else
        float moveHorizontal = CnInputManager.GetAxis("Horizontal");
#endif

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
}
