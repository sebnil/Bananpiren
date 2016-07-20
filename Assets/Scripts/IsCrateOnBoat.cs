using UnityEngine;
using System.Collections;

public class IsCrateOnBoat : MonoBehaviour {

    private Rigidbody rb;
    private Transform tr;
    public bool onBoat = false;

    // Use this for initialization
    void Start () {
        rb = GetComponent<Rigidbody>();
    }
	
	// Update is called once per frame
	void Update () {
        onBoat = OnBoat();
	}

    private bool OnBoat()
    {
        Vector3 pos = tr.transform.position;
        Vector3 vel = rb.velocity;

        if (pos.y < 0)
        {
            // under water
            return false;
        }

        if (Mathf.Abs(pos.x) > 14)
        {
            return false;
        }

        if (vel.magnitude > 2)
        {
            return false;
        }

        return true;
    }
}
