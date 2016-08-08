using UnityEngine;
using System.Collections;

public class DestroyAfterTimeout : MonoBehaviour {
	public float timeout;

	// Use this for initialization
	void Start () {
		StartCoroutine ("DestroyMe");
	}
	
	// Update is called once per frame
	void Update () {
	
	}


	IEnumerator DestroyMe() {
		yield return new WaitForSeconds(5);
		Destroy (this.gameObject);
	}
}
