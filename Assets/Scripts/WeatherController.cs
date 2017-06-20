﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WeatherController : Singleton<WeatherController>
{

    #region Singleton<T> boilerplate
    protected override bool isGlobalScope
    {
        get
        {
            return false;
        }
    }
    void Awake()
    {
        // You MUST call the base class onAwake() method
        //	before you exit Awake().
        onAwake();
    }
    void OnDestroy()
    {
        base.onDestroy();
    }
    #endregion

    [System.Serializable]
    public class WaveTimerThreshold
    {
        public float TimeThreshold;
        public float WaveFactor;
        public float RainOnScreenParticleSystemEmission;
        public float RainInGameParticleSystemSystemEmission;
        public float FogParticleSystemEmission;
        public float SunshineParticleSystemEmission;

        public WaveTimerThreshold(float TimeThreshold, float WaveFactor, float RainOnScreenParticleSystemEmission, float RainInGameParticleSystemSystemEmission, float FogParticleSystemEmission, float SunshineParticleSystemEmission)
        {
            this.TimeThreshold = TimeThreshold;
            this.WaveFactor = WaveFactor;
            this.RainOnScreenParticleSystemEmission = RainOnScreenParticleSystemEmission;
            this.RainInGameParticleSystemSystemEmission = RainInGameParticleSystemSystemEmission;
            this.FogParticleSystemEmission = FogParticleSystemEmission;
            this.SunshineParticleSystemEmission = SunshineParticleSystemEmission;
        }
    };
    private List<WaveTimerThreshold> WaveTimerThresholds = new List<WaveTimerThreshold>();

    public float currentWaveFactor = 0.05f;

    public float totalTime;

    public ParticleSystem RainOnScreenParticleSystem;
    public ParticleSystem RainInGameParticleSystem1;
    public ParticleSystem RainInGameParticleSystem2;
    public ParticleSystem FogParticleSystem;
    public ParticleSystem SunshineParticleSystem;
    

    // Use this for initialization
    void Start () {

        // fill in matrix for weather scheduling
        // time is seconds when weather should activate (which is quite low now for testing purposes)
        // rain is game rain
        // rS is rain on screen
        // fog is fog
        // sun is sunshine
        //                                            time, wave,   rain  rS   fog   sun
        WaveTimerThresholds.Add(new WaveTimerThreshold(2,   0,      0,    0,   0,    5));
        WaveTimerThresholds.Add(new WaveTimerThreshold(5,   0.1f,   0,    0,   0,    2));
        WaveTimerThresholds.Add(new WaveTimerThreshold(10,  0.2f,   50,   10,  0,    0));
        WaveTimerThresholds.Add(new WaveTimerThreshold(15,  0.4f,   100,  50,  20,   0));
        WaveTimerThresholds.Add(new WaveTimerThreshold(20,  0.4f,   200,  80,  100,  0));
        WaveTimerThresholds.Add(new WaveTimerThreshold(25,  0.2f,   50,   10,  10,   50));
        WaveTimerThresholds.Add(new WaveTimerThreshold(30,  0.2f,   0,    0,   0,    10));

        // start countdown timer
        StartCoroutine("Ticker");
    }

    IEnumerator Ticker()
    {
        while (true)
        {
            yield return new WaitForSeconds(1f);
            totalTime++;

            // update wave timers
            int? waveTimerIndex = null;
            for (int i = WaveTimerThresholds.Count-1; i >= 0; i--)
            {
                if (totalTime >= WaveTimerThresholds[i].TimeThreshold)
                {
                    waveTimerIndex = i;
                    break;
                }
            }
            Debug.Log("waveTimerIndex: " + waveTimerIndex);
            if (waveTimerIndex != null)
            {
                currentWaveFactor = WaveTimerThresholds[(int)waveTimerIndex].WaveFactor;

                // particle systems
                ParticleSystem.EmissionModule em = RainOnScreenParticleSystem.emission;
                em.rateOverTime = WaveTimerThresholds[(int)waveTimerIndex].RainOnScreenParticleSystemEmission;

                em = RainInGameParticleSystem1.emission;
                em.rateOverTime = WaveTimerThresholds[(int)waveTimerIndex].RainInGameParticleSystemSystemEmission;
                em = RainInGameParticleSystem2.emission;
                em.rateOverTime = WaveTimerThresholds[(int)waveTimerIndex].RainInGameParticleSystemSystemEmission;

                em = RainOnScreenParticleSystem.emission;
                em.rateOverTime = WaveTimerThresholds[(int)waveTimerIndex].RainOnScreenParticleSystemEmission;

                em = FogParticleSystem.emission;
                em.rateOverTime = WaveTimerThresholds[(int)waveTimerIndex].FogParticleSystemEmission;

                em = SunshineParticleSystem.emission;
                em.rateOverTime = WaveTimerThresholds[(int)waveTimerIndex].SunshineParticleSystemEmission;
            }
        }
    }

    float? wavesFactor = null;
    public bool WavesFactorChanged()
    {
        bool value = false;
        if (currentWaveFactor != wavesFactor && wavesFactor != null)
        {
            value = true;
        }
        wavesFactor = currentWaveFactor;
        return value;
    }
}
