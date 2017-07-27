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
    public class WaveTimerThreshold
    {
        public float TimeThreshold;
        public float WaveFactor;
        public float RainOnScreenParticleSystemEmission;
        public float RainInGameParticleSystemSystemEmission;
		public RainIntensity RainOnWaterIntensity;
        public float FogParticleSystemEmission;
        public float SunshineParticleSystemEmission;

		public WaveTimerThreshold(float TimeThreshold, float WaveFactor, float RainOnScreenParticleSystemEmission, float RainInGameParticleSystemSystemEmission, RainIntensity rainOnWaterIntensity, float FogParticleSystemEmission, float SunshineParticleSystemEmission)
        {
            this.TimeThreshold = TimeThreshold;
            this.WaveFactor = WaveFactor;
            this.RainOnScreenParticleSystemEmission = RainOnScreenParticleSystemEmission;
            this.RainInGameParticleSystemSystemEmission = RainInGameParticleSystemSystemEmission;
			this.RainOnWaterIntensity = rainOnWaterIntensity;
            this.FogParticleSystemEmission = FogParticleSystemEmission;
            this.SunshineParticleSystemEmission = SunshineParticleSystemEmission;
        }
    };
    private List<WaveTimerThreshold> WaveTimerThresholds = new List<WaveTimerThreshold>();
	private float? resetTimerAt;

    public float currentWaveFactor = 0.05f;

	public enum RainIntensity {
		NoRain,
		SomeRain,
		HeavyRain
	}


    public float totalTime;

    public ParticleSystem RainOnScreenParticleSystem;
    public ParticleSystem RainInGameParticleSystem1;
    public ParticleSystem RainInGameParticleSystem2;
	public RainIntensity RainOnWaterIntensity= RainIntensity.NoRain;
    public ParticleSystem FogParticleSystem;
    public ParticleSystem SunshineParticleSystem;
    

    // Use this for initialization
    void Start () {
		//RainOnWaterIntensity = RainIntensity.NoRain;

        // fill in matrix for weather scheduling
        // time is seconds when weather should activate (which is quite low now for testing purposes)
        // rain is game rain
        // rS is rain on screen
        // fog is fog
        // sun is sunshine
        //                                            time, wave,   rain  rS   rain on water            fog   sun
		WaveTimerThresholds.Add(new WaveTimerThreshold(0,   0.05f,  0,    0,   RainIntensity.NoRain,    0,    5));
		WaveTimerThresholds.Add(new WaveTimerThreshold(30,  0.1f,   0,    0,   RainIntensity.NoRain,    0,    2));
        // ramp up waves
		WaveTimerThresholds.Add(new WaveTimerThreshold(45,  0.2f,   50,   10,  RainIntensity.SomeRain,  0,    0));
		WaveTimerThresholds.Add(new WaveTimerThreshold(65,  0.4f,   100,  50,  RainIntensity.HeavyRain, 20,   0));
		WaveTimerThresholds.Add(new WaveTimerThreshold(80,  0.5f,   200,  80,  RainIntensity.HeavyRain, 100,  0));
        // ramp down waves
        WaveTimerThresholds.Add(new WaveTimerThreshold(100,  0.2f,   50,   10,  RainIntensity.SomeRain,  10,   50));
        WaveTimerThresholds.Add(new WaveTimerThreshold(105,  0.1f,   0,    0,  RainIntensity.NoRain, 50, 0));
        // last ramp up
        WaveTimerThresholds.Add(new WaveTimerThreshold(130,  0.4f,   100,  20, RainIntensity.SomeRain, 20, 0));
        WaveTimerThresholds.Add(new WaveTimerThreshold(140,  0.5f,  200,  20, RainIntensity.SomeRain, 50, 0));
        WaveTimerThresholds.Add(new WaveTimerThreshold(150,  0.65f, 200,  20, RainIntensity.SomeRain, 50, 0));
        WaveTimerThresholds.Add(new WaveTimerThreshold(160,  0.8f,  200,  10, RainIntensity.NoRain, 50, 0));
        resetTimerAt = null;

        // start countdown timer
        StartCoroutine("Ticker");
    }

    IEnumerator Ticker()
    {
        while (true)
        {
            yield return new WaitForSeconds(1f);
            totalTime++;
            if (resetTimerAt != null && totalTime > resetTimerAt) {
				totalTime = 0;
			}

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

				RainOnWaterIntensity = WaveTimerThresholds[(int)waveTimerIndex].RainOnWaterIntensity;

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
