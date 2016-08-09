using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class GameController : MonoBehaviour {
    public GameObject gamePanel;
	public GameObject gameOverPanel;
    public GameObject touchController;

    public GameObject hazard;

    public Vector3 spawnValues;

    public float spawnWait;
    public float startWait;
    public float waveWait;

    public int hazardCount;

    public int xMean;

    public Text progressText;
	public Text timeLeftText;
    public int numberOfCratesOnBoat = 0;
    public int maxNumberOfCratesOnBoat = 0;
	public int numberOfCratesDelivered = 0;
	public float timeLeft;
	public float crateDeliveredTimeBonus = 5;
	public float crateDroppedTimePunishment = 10;
	public float crateDeliveredTimeBonusDecrementFactor;
	private bool gameOver = false;

    Ray ray;
    RaycastHit hit;
    public GameObject cratePrefab;

	public GameObject craneObject;
	private Crane craneScript;

    // Use this for initialization
    void Start () {
		craneScript = craneObject.GetComponent<Crane>();

        // only show touch buttons on mobile
#if UNITY_STANDALONE
        touchController.SetActive(false);
#endif
        // force landscape on mobile
        Screen.orientation = ScreenOrientation.LandscapeLeft;

		// start countdown timer
		StartCoroutine("GameOverTimer");
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

				if (hit.transform.gameObject.name == "JointHolder") 
				{
					craneScript.LetGoOfCrate ();
				} 
				else 
				{
					GameObject obj = Instantiate(cratePrefab, new Vector3(hit.point.x, hit.point.y, 0), Quaternion.identity) as GameObject;
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

		progressText.text = "Number of crates delivered: " + numberOfCratesDelivered;
		timeLeftText.text = "Time left: " + Mathf.Floor(timeLeft) + "s";

		// if game is over and game is running, pause
		/*if (gameOver && !gamePanel.activeSelf) {
			Time.timeScale = 0f;
		}*/
    }

	public void IncrementNumberOfCratesDelivered() {
		numberOfCratesDelivered++;
		timeLeft += crateDeliveredTimeBonus;
	}

	public void PunishForDroppedCrate() {
		timeLeft -= crateDroppedTimePunishment;
		if (timeLeft < 0) {
			timeLeft = 0;
		}
	}

    public void ToggleMenu()
    {
		if (gameOver) {
			// pause game and show menu
			gameOverPanel.SetActive(true);
			Time.timeScale = 0f;
		}
        else if (gamePanel.activeSelf)
        {   
            // run game
            gamePanel.SetActive(false);
            Time.timeScale = 1.0f;
        }
        else
        {
            // pause game and show menu
            gamePanel.SetActive(true);
            Time.timeScale = 0f;
        }
    }

    public void RestartScene()
    {
        SceneManager.LoadScene(SceneManager.GetActiveScene().name);
        gamePanel.SetActive(false);
        Time.timeScale = 1.0f;
    }

    public void ExitGame()
    {
        Application.Quit();
    }

	IEnumerator GameOverTimer() {
		while (true) {
			yield return new WaitForSeconds (1f);

			if (crateDeliveredTimeBonus > 2) {
				crateDeliveredTimeBonus = crateDeliveredTimeBonus - Time.timeSinceLevelLoad * crateDeliveredTimeBonusDecrementFactor;
			} else {
				crateDeliveredTimeBonus = 2;
			}

			if (!gameOver && timeLeft > 0) {
				timeLeft--;
			} else if (!gameOver) {
				gameOver = true;
				ToggleMenu ();
			} else {
				// do nothign
			}
		}
	}
		
}
