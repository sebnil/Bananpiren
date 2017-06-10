using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class TutorialController : MonoBehaviour {
    public Text DropCrateText;
    public Text DeliverWhereText;
    public Crane crane;

    private IEnumerator coroutine;
    private bool tutorialCoroutineDone = false;

    // Use this for initialization
    void Start () {
		if ( !PlatformHelperFunctions.isMobile() )
        {
            DropCrateText.text = "Press space to \nrelease crate...";
        }
        else
        {
            DropCrateText.text = "Tap on screen to \nrelease crate...";
        }

        coroutine = WaitAndThenShowTutorial(2.0f);
        StartCoroutine(coroutine);
    }
	
	// Update is called once per frame
	void Update () {
		if (tutorialCoroutineDone)
        {
            if (GameController.Instance.numberOfCratesDelivered > 0)
            {
                Destroy(this);
            }
            else if (crane.PlayerHasDropedAtLeastOneCrate)
            {
                DropCrateText.gameObject.SetActive(false);
            }
        }
	}

    // every 2 seconds perform the print()
    private IEnumerator WaitAndThenShowTutorial(float waitTime)
    {
        yield return new WaitForSeconds(waitTime);
        if ( !crane.PlayerHasDropedAtLeastOneCrate )
        {
            DropCrateText.gameObject.SetActive(true);
            DeliverWhereText.gameObject.SetActive(true);
        }
        else if (crane.PlayerHasDropedAtLeastOneCrate && GameController.Instance.numberOfCratesDelivered == 0)
        {
            DropCrateText.gameObject.SetActive(false);
            DeliverWhereText.gameObject.SetActive(true);
        }
        else
        {

        }
        tutorialCoroutineDone = true;
    }
}
