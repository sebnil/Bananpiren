using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnableOnlyIfSocialAuthenticated : MonoBehaviour {

    private void OnEnable()
    {
        hideOrShowDependingOnAuthenticationStatus();
    }
    private void OnDisable()
    {
        hideOrShowDependingOnAuthenticationStatus();
    }

    void hideOrShowDependingOnAuthenticationStatus()
    {
        if (Social.localUser.authenticated && !gameObject.activeSelf)
        {
            gameObject.SetActive(true);
        }
        else if (!Social.localUser.authenticated && gameObject.activeSelf)
        {
            gameObject.SetActive(false);
        }

    }
}
