using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnableOnlyIfDebugRelease : MonoBehaviour {

	// Use this for initialization
	void Start () {
        hideOrShowDependingOnDebugRelease();
    }
	
	// Update is called once per frame
	void OnEnable ()
    {
        hideOrShowDependingOnDebugRelease();
    }

    private void hideOrShowDependingOnDebugRelease()
    {
        if (AppInfo.debugRelease && !gameObject.activeSelf)
        {
            gameObject.SetActive(true);
        }
        else if (!AppInfo.debugRelease && gameObject.activeSelf)
        {
            gameObject.SetActive(false);
        }
    }
}
