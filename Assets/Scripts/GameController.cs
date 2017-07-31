using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using com.kleberswf.lib.core;
using Bananpiren.Secrets;

public enum GameState {Running, Paused, GameOver};

public class GameController : Singleton<GameController> {

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


    public GameObject gamePanel;
	public GameObject gameOverPanel;

    public GameObject hazard;

    public Vector3 spawnValues;

    public float spawnWait;
    public float startWait;
    public float waveWait;

    public int hazardCount;

    public int xMean;


    public int numberOfCratesOnBoat = 0;
    public int maxNumberOfCratesOnBoat = 0;
	public int numberOfCratesDelivered = 0;
    public float totalTime;
	public float timeLeft;
	public GameState gameState = GameState.Running;

    public float crateDroppedTimePunishment;

    [System.Serializable]
	public class CrateTimers
	{
		public int timerStart;
		public int yellowThreshold;
		public int brownThreshold;
		public int rottenThreshold;

		public float timeBonusGreen;
		public float timeBonusYellow;
		public float timeBonusBrown;
		public float timeBonusRotten;
	}
	public CrateTimers crateTimers;

    [System.Serializable]
    public class RipenTimers
    {
        public float ripenFactor2Threshold;
        public float ripenFactor2Factor;
        public float ripenFactor3Threshold;
        public float ripenFactor3Factor;
    }
    public RipenTimers ripenTimers;
    public float currentRipenFactor;

    Ray ray;
    RaycastHit hit;
    public GameObject cratePrefab;

	public GameObject craneObject;
	private Crane craneScript;

    // Music and sound
    public AudioSource musicSource;
    AudioSource clockTick;

    // Use this for initialization
    void Start () {
		craneScript = craneObject.GetComponent<Crane>();

        var audioSources = GetComponents<AudioSource>();
        musicSource = audioSources[0];
        clockTick = audioSources[1];

        // start countdown timer
        StartCoroutine("GameOverTimer");

        // update music state
        StartOrStopMusic();

		AudioListener.volume = 1;

        
    }
	
	// Update is called once per frame
	void Update () {
        // menu control
        if (Input.GetKeyUp(KeyCode.Escape))
        {
            ToggleMenu();
        }

        // create crate on touch and mouse click
        ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        if (Physics.Raycast(ray, out hit))
        {
            if (Input.GetMouseButtonDown(0))
            {
				Debug.Log (hit.transform.gameObject.name);

				if (AppInfo.debugRelease && hit.transform.gameObject.name == "DebugCrateRaycastTarget") {
                    GameObject obj = Instantiate (cratePrefab, new Vector3 (hit.point.x, hit.point.y, 0), Quaternion.identity) as GameObject;
				}
            }
        }

		if (Input.GetKeyDown ("space")) 
		{
			craneScript.LetGoOfCrate ();
		}

        // calculate crates on the boat
        numberOfCratesOnBoat = 0;
        GameObject[] gos;
        gos = GameObject.FindGameObjectsWithTag("Crate");
        foreach (GameObject go in gos)
        {
            Crate script = go.GetComponent<Crate>();
            bool crateOnBoat = script.onBoat;
            if (crateOnBoat)
            {
                numberOfCratesOnBoat++;
            }

        }
        if (numberOfCratesOnBoat > maxNumberOfCratesOnBoat)
        {
            maxNumberOfCratesOnBoat = numberOfCratesOnBoat;
        }
    }

	public void IncrementNumberOfCratesDelivered(Crate.CrateState crateState) {
		numberOfCratesDelivered++;
		switch (crateState) {
		    case Crate.CrateState.Green:
			    timeLeft += crateTimers.timeBonusGreen;
			    break;
		    case Crate.CrateState.Yellow:
			    timeLeft += crateTimers.timeBonusYellow;
			    break;
		    case Crate.CrateState.Brown:
			    timeLeft += crateTimers.timeBonusBrown;
			    break;
		    case Crate.CrateState.Rotten:
			    timeLeft += crateTimers.timeBonusRotten;
			    break;
		}

	}

	public void PunishForDroppedCrate() {
		timeLeft -= crateDroppedTimePunishment;
		if (timeLeft < 0) {
			timeLeft = 0;
		}
	}

    public void ToggleMenu()
    {
		if (gameState == GameState.GameOver) {
			// pause game and show menu
			gameOverPanel.SetActive(true);
			//gameState = GameState.Paused;
			Time.timeScale = 0f;
			AudioListener.volume = 0;
		}
		else if (gameState == GameState.Paused)
        {   
            // run game
            gamePanel.SetActive(false);
			gameState = GameState.Running;
            Time.timeScale = 1.0f;
			AudioListener.volume = 1;
        }
        else
        {
            // pause game and show menu
            gamePanel.SetActive(true);
			gameState = GameState.Paused;
            Time.timeScale = 0f;
			AudioListener.volume = 0;
        }

        // update music state
        StartOrStopMusic();
    }

    IEnumerator GameOverTimer() {
        while (true) {
            yield return new WaitForSeconds(1f);

            totalTime++;

            // update ripen factor
            if (totalTime >= ripenTimers.ripenFactor3Threshold)
            {
                currentRipenFactor = ripenTimers.ripenFactor3Factor;
            }
            else if (totalTime >= ripenTimers.ripenFactor2Threshold)
            {
                currentRipenFactor = ripenTimers.ripenFactor2Factor;
            }
            else
            {
                currentRipenFactor = 1;
            }

            if (gameState == GameState.Running && timeLeft > 0) {
                timeLeft--;

                if (timeLeft < 10)
                {
                    clockTick.Play();
                }

                if (timeLeft < 0) {
                    timeLeft = 0;
                }
            } else if (!AppInfo.debugRelease && gameState == GameState.Running) {
                GameOver();
            } else {
                // do nothing
            }
        }
    }

    public void GameOver()
    {
        gameState = GameState.GameOver;
        
        ToggleMenu();
    }

    public int GetLastScore()
    {
        return numberOfCratesDelivered;
    }

    public void DebugIncreaseTime()
    {
        timeLeft += 60;
    }

    public void DebugDecreaseTime()
    {
        timeLeft -= 4;
    }

    public void StartOrStopMusic()
    {
        bool musicEnabled = GUIHandler.Instance.GetMusicPreference();
        bool musicAllowed = (gameState == GameState.Running);

        // stop music if it is either not enabled or allowed
        if (!musicEnabled || !musicAllowed)
        {
            musicSource.Pause();
        }
        // start playing music if it is not playing, it is enabled and allowed
        else if (!musicSource.isPlaying && musicEnabled && musicAllowed)
        {
            musicSource.Play();
        }
        else
        {
            // do nothing
        }
    }


}
