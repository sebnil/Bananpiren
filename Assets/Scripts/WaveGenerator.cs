using UnityEngine;
using System.Collections;

public class WaveGenerator : MonoBehaviour {
    //public Vector2 range = new Vector2(0.1f, 1);
    float[] randomTimes;
    Mesh mesh;
    public float waveSpeed;
    public float noiseStrength;
    public float noiseWalk = 1.0f;
    public float waveDistance;
    public float waveScale;

	Renderer renderer;


    // Use this for initialization
    void Start () {
        mesh = GetComponent<MeshFilter>().mesh;
        randomTimes = new float[mesh.vertices.Length];

		renderer = GetComponent<Renderer>();
		//rend.material.shader = Shader.Find("Shader Forge/Water");
		//Shader shader = renderer.material.shader;
		renderer.material.SetFloat("_Rainswitch", 1);
    }
	
	// Update is called once per frame
	void FixedUpdate () {

        waveScale = WeatherController.Instance.currentWaveFactor;
		Debug.Log ("WeatherController.Instance.RainOnWaterIntensity: " + WeatherController.Instance.RainOnWaterIntensity);

		switch (WeatherController.Instance.RainOnWaterIntensity) 
		{
		case WeatherController.RainIntensity.HeavyRain:
			renderer.material.SetFloat("_Rainnormal", 0f);
			renderer.material.SetFloat("_Rainswitch", 1f);
			break;
		case WeatherController.RainIntensity.SomeRain:
			renderer.material.SetFloat("_Rainnormal", 1f);
			renderer.material.SetFloat("_Rainswitch", 0f);
			break;
		default:
			renderer.material.SetFloat("_Rainnormal", 0f);
			renderer.material.SetFloat("_Rainswitch", 0f);
			break;
		}

        //mesh = GetComponent<MeshFilter>().mesh;
        Vector3[] vertices = mesh.vertices;

        for (int i = 0;i < vertices.Length; i++)
        {
            /*float x = vertices[i].x;
            float y = 0;
            float z = vertices[i].z;*/
            
            Vector3 position = new Vector3(vertices[i].x, 0, vertices[i].z);
            Vector3 globalVerticePosition = transform.TransformPoint(position);
            //Debug.Log("i: " + i + "pos: " + globalVerticePosition.x + " " + globalVerticePosition.z);

            float time = Time.time;

            float y = GetWaveYHeight(globalVerticePosition, time);

            vertices[i].y = y;
        }
        mesh.vertices = vertices;
        mesh.RecalculateNormals();
    }


    public float GetWaveYHeight(Vector3 position, float time)
    {
        float y = 0;

        float waveType = position.x;
        //float waveType = position.x;// + position.z * 0.5f;
        //float waveType = position.x + position.z;
        y += waveScale * Mathf.Sin((float)(time * waveSpeed + waveType) / waveDistance);
        y += noiseStrength * Mathf.PerlinNoise(position.x + noiseWalk, position.z + Mathf.Sin(time * 0.1f));

        return y;
    }
}
