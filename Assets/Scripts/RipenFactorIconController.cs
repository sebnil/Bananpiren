using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class RipenFactorIconController : MonoBehaviour {
    public Image icon;
    public Sprite factor1;
    public Sprite factor2;
    public Sprite factor3;
    public Sprite factor4;

    Transform tr;

    float animationRate = 1f;
    float animationTimer = 1;

    private void Start()
    {
        tr = GetComponent<Transform>();
    }
    void Update()
    {

        float scale = HUDController.stepAnimationTimer(ref animationTimer, 2, 1, animationRate, ripenFactorChanged());
        tr.localScale = new Vector3(scale, scale, 1);

        if (WeatherController.Instance.currentWaveFactor <= 0.1)
        {
            icon.sprite = factor1;
        }
        else if (WeatherController.Instance.currentWaveFactor <= 0.4)
        {
            icon.sprite = factor2;
        }
        else if (WeatherController.Instance.currentWaveFactor <= 0.7)
        {
            icon.sprite = factor3;
        }
        else
        {
            icon.sprite = factor4;
        }

    }

    float? ripenFactor = null;
    bool ripenFactorChanged()
    {
        bool value = false;
        if (GameController.Instance.currentRipenFactor != ripenFactor && ripenFactor != null)
        {
            value = true;
        }
        ripenFactor = GameController.Instance.currentRipenFactor;
        return value;
    }
}
