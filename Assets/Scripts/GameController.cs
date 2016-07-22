using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class GameController : MonoBehaviour {
    public GameObject gamePanel;
    public GameObject touchController;

    public GameObject hazard;

    public Vector3 spawnValues;

    public float spawnWait;
    public float startWait;
    public float waveWait;

    public int hazardCount;

    public int xMean;

    public Text progressText;
    public int numberOfCratesOnBoat = 0;
    public int maxNumberOfCratesOnBoat = 0;

    // Use this for initialization
    void Start () {
        // only show touch buttons on mobile
#if UNITY_STANDALONE
        touchController.SetActive(False);
#endif


        // wave corut
        StartCoroutine(SpawnWaves());
    }
	
	// Update is called once per frame
	void Update () {
        if (Input.GetKeyUp(KeyCode.Escape))
        {
            ToggleMenu();
        }

        numberOfCratesOnBoat = 0;
        GameObject[] gos;
        gos = GameObject.FindGameObjectsWithTag("Crate");
        foreach (GameObject go in gos)
        {
            IsCrateOnBoat script = go.GetComponent<IsCrateOnBoat>();
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

        progressText.text = "Crates stacked on boat: " + numberOfCratesOnBoat +
            "\nMaximum crates stacked: " + maxNumberOfCratesOnBoat;
    }

    public void ToggleMenu()
    {

        if (gamePanel.activeSelf)
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

    IEnumerator SpawnWaves()
    {
        yield return new WaitForSeconds(startWait);
        while (true)
        {
            for (int i = 0; i < hazardCount; i++)
            {
                for (int port = 0; port < 2; port++)
                {
                    int swapSide = 1;
                    if (port == 0)
                    {
                        swapSide = -1;
                    }
                    Vector3 spawnPosition = new Vector3(Random.Range(swapSide*xMean - spawnValues.x, swapSide*xMean + spawnValues.x), spawnValues.y, spawnValues.z);
                    Quaternion spawnRotation = Quaternion.identity;
                    Instantiate(hazard, spawnPosition, spawnRotation);
                }

                yield return new WaitForSeconds(spawnWait);
            }
            yield return new WaitForSeconds(waveWait);
        }
    }
}
