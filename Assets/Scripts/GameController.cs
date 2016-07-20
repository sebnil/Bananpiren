using UnityEngine;
using System.Collections;

public class GameController : MonoBehaviour {
    public GameObject hazard;

    public Vector3 spawnValues;

    public float spawnWait;
    public float startWait;
    public float waveWait;

    public int hazardCount;

    public int xMean;

    public int numberOfCratesOnBoat = 0;

    // Use this for initialization
    void Start () {
        StartCoroutine(SpawnWaves());
    }
	
	// Update is called once per frame
	void Update () {
        if (Input.GetKey(KeyCode.Escape))
        {
            Application.Quit();
        }

        numberOfCratesOnBoat = 0;
        GameObject[] gos;
        gos = GameObject.FindGameObjectsWithTag("Crate");
        foreach (GameObject go in gos)
        {
            bool crateOnBoat = false;// go.onBoat;
            if (crateOnBoat)
            {
                numberOfCratesOnBoat++;
            }

        }
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
