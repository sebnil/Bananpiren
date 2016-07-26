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

    // Use this for initialization
    void Start () {
        mesh = GetComponent<MeshFilter>().mesh;
        randomTimes = new float[mesh.vertices.Length];
    }
	
	// Update is called once per frame
	void Update () {

        //mesh = GetComponent<MeshFilter>().mesh;
        Vector3[] vertices = mesh.vertices;
        
        for (int i = 0;i < vertices.Length; i++)
        {
            vertices[i].y = vertices[i].y + waveScale * Mathf.Sin((float)(Time.time * waveSpeed + vertices[i].x) / waveDistance);
            vertices[i].y = vertices[i].y + noiseStrength * Mathf.PerlinNoise(vertices[i].x + noiseWalk, vertices[i].y + Mathf.Sin(Time.time * 0.1f));
        }
        mesh.vertices = vertices;
        mesh.RecalculateNormals();
    }
}
