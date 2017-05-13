using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class LeaderboardMessageController : MonoBehaviour {
    Text message;
    GameController gameController;

    void Start()
    {
        gameController = GameObject.FindWithTag("GameController").GetComponent<GameController>();
        message = GetComponent<Text>();
    }

    void Update()
    {
        if (Social.localUser.authenticated)
        {        
            message.text = "You delivered " + gameController.GetLastScore().ToString("F0") + " crates! Check out the leaderboard!";
        }
        else
        {
            message.text = "You delivered " + gameController.GetLastScore().ToString("F0") + " crates!";
        }

    }
}
