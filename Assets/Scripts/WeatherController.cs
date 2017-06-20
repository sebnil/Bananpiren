using System.Collections;
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
    public struct WaveTimerThreshold
    {
        public float TimeThreshold;
        public float WaveFactor;
    };
    public WaveTimerThreshold[] WaveTimerThresholds;

    public float totalTime;

    [System.Serializable]
    public class WaveTimers
    {
        public float waveFactor2Threshold;
        public float waveFactor2Factor;
        public float waveFactor3Threshold;
        public float waveFactor3Factor;
    }
    public WaveTimers waveTimers;
    public float currentWaveFactor = 0.05f;

    // Use this for initialization
    void Start () {
        // start countdown timer
        StartCoroutine("Ticker");
    }
	
	// Update is called once per frame
	void Update () {
		
	}

    IEnumerator Ticker()
    {
        while (true)
        {
            yield return new WaitForSeconds(1f);


            // update wave timers
            int? waveTimerIndex = null;
            for (int i = WaveTimerThresholds.Length-1; i >= 0; i--)
            {
                if (totalTime >= WaveTimerThresholds[i].TimeThreshold)
                {
                    waveTimerIndex = i;
                }
            }
            if (waveTimerIndex != null)
            {
                currentWaveFactor = WaveTimerThresholds[(int)waveTimerIndex].WaveFactor;
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
