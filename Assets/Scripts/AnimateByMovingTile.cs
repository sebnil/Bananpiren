using UnityEngine;
using System.Collections;

class AnimateByMovingTile : MonoBehaviour
{
    public float framesPerSecond = 10f;

    //the current frame to display
    public float A;
    public float w;

    void Start()
    {
        StartCoroutine(updateTiling());

    }

    private IEnumerator updateTiling()
    {
        while (true)
        {
            float x = A * Mathf.Cos(Time.time * w);
            float y = A * Mathf.Sin(Time.time * w);
            Vector2 offset = new Vector2(x, y);

            GetComponent<Renderer>().sharedMaterial.SetTextureOffset("_MainTex", offset);

            yield return new WaitForSeconds(1f / framesPerSecond);
        }

    }
}