using UnityEngine;
using System.Collections;

public class IsCrateOnBoat : MonoBehaviour {

    private Rigidbody rb;
    private Transform tr;
    private Renderer renderer;

    public Rigidbody boatRigidBody;

    public bool onBoat = false;
    public bool inCargoZone = false;
    public float relativeVelocityMagnitude;

    public Material crateOnBoatMaterial;
    public Material crateNotOnBoatMaterial;

    // Use this for initialization
    void Start () {
        rb = GetComponent<Rigidbody>();
        tr = GetComponent<Transform>();
        renderer = GetComponent<Renderer>();

        boatRigidBody = GameObject.FindWithTag("Player").GetComponent<Rigidbody>();
    }
	
	// Update is called once per frame
	void Update () {
        onBoat = OnBoat();
        
        if (onBoat)
        {
            renderer.material = crateOnBoatMaterial;
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

        if (pos.y < 0)
        {
            // under water
            return false;
        }

        if (Mathf.Abs(pos.x) > 14)
        {
            // on dock
            return false;
        }

        if (relativeVelocityMagnitude > 0.5)
        {
            // moving too much compared to boat
            return false;
        }

        return true;
    }
}
