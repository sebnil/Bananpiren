using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class HUDController : MonoBehaviour {
    public Transform progressTransform;
    public Text progressText;
    public Transform timeLeftTransform;
    public Text timeLeftText;
    public Transform ripenFactorTransform;
    public Text ripenFactorText;
    public Text wavesFactorText;
    public Text debugText;

    float animationRate = 0.5f;

    int timeLeftOriginalFontSize = 30;
    int timeLeftWarningFontSize = 50;

    // Use this for initialization
    void Start () {
		
	}

    // Update is called once per frame
    float newCrateDeliveredAnimationTimer = 1;
    float ripenFactorAnimationTimer = 1;
    float wavesFactorAnimationTimer = 1;

    void Update () {
        progressText.text = GameController.Instance.numberOfCratesDelivered.ToString();
        timeLeftText.text = Mathf.Floor(GameController.Instance.timeLeft).ToString();
        ripenFactorText.text = "Ripen x" + GameController.Instance.currentRipenFactor;
        wavesFactorText.text = "Waves x" + GameController.Instance.currentWaveFactor * 10f;

        debugText.text = "\nver " + BuildConstants.version;


        // animations when crates get delivered
        if (newCrateDelivered())
        {
            newCrateDeliveredAnimationTimer = 0;
        }
        else
        {
            stepAnimationTimer(ref newCrateDeliveredAnimationTimer, animationRate);
        }

        if (ripenFactorChanged())
        {
            ripenFactorAnimationTimer = 0;
        }
        else
        {
            stepAnimationTimer(ref ripenFactorAnimationTimer, animationRate);
        }

        float scale = Mathf.Lerp(2, 1, newCrateDeliveredAnimationTimer);
        timeLeftTransform.localScale = new Vector3(scale, scale, 1);
        progressTransform.localScale = new Vector3(scale, scale, 1);

        scale = Mathf.Lerp(2, 1, ripenFactorAnimationTimer);
        ripenFactorTransform.localScale = new Vector3(scale, scale, 1);

        // warn the gamer that time is almost up
        if (GameController.Instance.timeLeft < 10)
        {
            timeLeftText.fontSize = timeLeftWarningFontSize;
            timeLeftText.color = Color.red;
        }
        else
        {
            timeLeftText.fontSize = timeLeftOriginalFontSize;
            timeLeftText.color = Color.black;
        }
    }

    void stepAnimationTimer(ref float timer, float animationRate)
    {
        if (timer < 1)
        {
            timer += Time.deltaTime * animationRate;
        }
        else
        {
            timer = 1;
        }
    }

    int cratesDelivered = 0;
    bool newCrateDelivered()
    {
        bool value = false;
        if (GameController.Instance.numberOfCratesDelivered != cratesDelivered)
        {
            value = true;
        }
        cratesDelivered = GameController.Instance.numberOfCratesDelivered;
        return value;
    }

    float ripenFactor = 0;
    bool ripenFactorChanged()
    {
        bool value = false;
        if (GameController.Instance.currentRipenFactor != ripenFactor)
        {
            value = true;
        }
        ripenFactor = GameController.Instance.currentRipenFactor;
        return value;
    }
}
