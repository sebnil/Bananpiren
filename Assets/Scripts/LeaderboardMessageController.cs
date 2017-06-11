using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class LeaderboardMessageController : MonoBehaviour {
    Text message;
    

    void Start()
    {
        message = GetComponent<Text>();
    }

    void Update()
    {


        if (Social.localUser.authenticated)
        {        
            message.text = "You delivered " + GameController.Instance.GetLastScore().ToString("F0") + " crates! Check out the leaderboard!";
        }
        else
        {
            message.text = "You delivered " + GameController.Instance.GetLastScore().ToString("F0") + " crates!";
        }


    }


}
