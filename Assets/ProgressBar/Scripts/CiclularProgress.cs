using UnityEngine;
using System.Collections;

public class CiclularProgress : MonoBehaviour {
	
    float _percentDone = 0;
    public float PercentDone {
        get {
            return _percentDone;
        }
        set {
            _percentDone = value;
            setProgress(value);
        }
    }


    void setProgress(float v)
    {
        gameObject.GetComponent<Renderer>().material.SetFloat("_Progress", v);
    }
}