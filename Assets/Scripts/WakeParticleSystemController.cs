using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WakeParticleSystemController : MonoBehaviour {
	ParticleSystem.EmissionModule em;
	ParticleSystem ps;
	public Rigidbody rb;

	void Start() {
		ps = GetComponent<ParticleSystem>();
		em = ps.emission;
		em.enabled = true;

		//em.type = ParticleSystemEmissionType.Time;

	}
	
	// Update is called once per frame
	void Update () {
		float rotationX;
		if (rb.velocity.x > 0) {
			rotationX = -90f;
		}
		else {
			rotationX = 90f;
		}
		ps.transform.localEulerAngles = new Vector3 (rotationX, 0f, 0f);
		em.rateOverTime = 10f * Mathf.Abs(rb.velocity.x);
		//ps.main.startSpeed = rb.velocity.x;
		ps.startSpeed = 0.5f * Mathf.Abs(rb.velocity.x);
	}
}
