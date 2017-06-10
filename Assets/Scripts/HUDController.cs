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
    public Transform wavesFactorTransform;
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
        float scale = stepAnimationTimer(ref newCrateDeliveredAnimationTimer, animationRate, newCrateDelivered());
        timeLeftTransform.localScale = new Vector3(scale, scale, 1);
        progressTransform.localScale = new Vector3(scale, scale, 1);

        float scale2 = stepAnimationTimer(ref ripenFactorAnimationTimer, animationRate, ripenFactorChanged());
        ripenFactorTransform.localScale = new Vector3(scale2, scale2, 1);

        scale = stepAnimationTimer(ref wavesFactorAnimationTimer, animationRate, wavesFactorChanged());
        wavesFactorTransform.localScale = new Vector3(scale, scale, 1);

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

    float stepAnimationTimer(ref float timer, float animationRate, bool reset)
    {
        if (reset)
        {
            timer = 0;
        }
        else if (timer < 1)
        {
            timer += Time.deltaTime * animationRate;
        }
        else
        {
            timer = 1;
        }
        return Mathf.Lerp(2, 1, timer);
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

    float wavesFactor = 0;
    bool wavesFactorChanged()
    {
        bool value = false;
        if (GameController.Instance.currentWaveFactor != wavesFactor)
        {
            value = true;
        }
        wavesFactor = GameController.Instance.currentWaveFactor;
        return value;
    }
}
