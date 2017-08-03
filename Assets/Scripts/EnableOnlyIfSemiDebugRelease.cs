using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnableOnlyIfSemiDebugRelease : MonoBehaviour {

	// Use this for initialization
	void Start () {
        hideOrShowDependingOnSemiDebugRelease();
    }
	
	// Update is called once per frame
	void OnEnable ()
    {
        hideOrShowDependingOnSemiDebugRelease();
    }

    private void hideOrShowDependingOnSemiDebugRelease()
    {
        if (AppInfo.SemiDebugRelease && !gameObject.activeSelf)
        {
            gameObject.SetActive(true);
        }
        else if (!AppInfo.SemiDebugRelease && gameObject.activeSelf)
        {
            gameObject.SetActive(false);
        }
    }
}
