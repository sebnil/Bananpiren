using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class WavesIconController : MonoBehaviour {
    public Image icon;
    public Sprite waveFactor1;
    public Sprite waveFactor2;
    public Sprite waveFactor3;
    public Sprite waveFactor4;

    Transform wavesFactorTransform;

    float animationRate = 1f;
    float wavesFactorAnimationTimer = 1;

    private void Start()
    {
        wavesFactorTransform = GetComponent<Transform>();
    }
    void Update () {

        float scale = HUDController.stepAnimationTimer(ref wavesFactorAnimationTimer, 2, 1, animationRate, waveIconChanged());
        wavesFactorTransform.localScale = new Vector3(scale, scale, 1);

        if (WeatherController.Instance.currentWaveFactor <= 0.1)
        {
            icon.sprite = waveFactor1;
        }
        else if (WeatherController.Instance.currentWaveFactor <= 0.4)
        {
            icon.sprite = waveFactor2;
        }
        else if (WeatherController.Instance.currentWaveFactor <= 0.7)
        {
            icon.sprite = waveFactor3;
        }
        else
        {
            icon.sprite = waveFactor4;
        }

    }

    Sprite sprite = null;
    bool ignoreFirst = true;
    bool waveIconChanged()
    {
        bool value = false;

        if (icon.sprite != sprite && sprite != null)
        {
            value = true;
        }
        sprite = icon.sprite;

        return value;
    }
}
