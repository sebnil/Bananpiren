using Bananpiren.Secrets;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LeaderboardController : MonoBehaviour {

    public enum LeaderboardReportingState
    {
        UserHasNotAnsweredNagScreen,
        TryingToAuthenticate,
        Authenticated,
    }

    bool hasTriedToAuthenticate = false;

    // Use this for initialization
    void Start () {
        // event listeners
        GameController.Instance.GameOverEvent += gameOverEvent;
        SocialPlatformNagScreenController.Instance.UserAnsweredNagScreen += userAnsweredNagScreenEvent;
        LeaderboardManager.AuthenticationDone += authenticationDoneEvent;
	}

    void tryToReportScore()
    {
        Debug.Log("LeaderboardController::tryToReportScore");

        if (!PlatformHelperFunctions.hasSocialPlatformCapabilities())
        {
            Debug.Log("LeaderboardController::tryToReportScore. hasSocialPlatformCapabilities is false. return..");
            return;
        }
        else if (GameController.Instance.numberOfCratesDelivered == 0)
        {
            Debug.Log("LeaderboardController::tryToReportScore. numberOfCratesDelivered == 0. return..");
            return;
        }
        else if (LeaderboardManager.ScoreHasBeenReported)
        {
            Debug.Log("LeaderboardController::tryToReportScore. ScoreHasBeenReported. return..");
            return;
        }
        else if (!Social.localUser.authenticated)
        {
            Debug.Log("LeaderboardController::tryToReportScore. not authenticated. should authentication be tried?");
            if (SocialPlatformNagScreenController.Instance.nagScreenStateMachine == SocialPlatformNagScreenController.NagScreenState.GamerDoesNotWantToDoItNow || SocialPlatformNagScreenController.Instance.nagScreenStateMachine == SocialPlatformNagScreenController.NagScreenState.NoNagSoDontShowModal)
            {
                Debug.Log("LeaderboardController::tryToReportScore. not authenticated and user does not want to. return..");
                return;
            }
            else
            {
                Debug.Log("LeaderboardController::tryToReportScore. tryToAuthenticate");
                tryToAuthenticate();
            }
        }
        else
        {
            LeaderboardManager.ReportScore(GameController.Instance.numberOfCratesDelivered, SocialPlatformConstants.leaderBoardId);
        }        
    }

    void tryToAuthenticate()
    {
        Debug.Log("LeaderboardController::tryToAuthenticate");

        if (Social.localUser.authenticated)
        {
            Debug.Log("LeaderboardController::tryToAuthenticate. already authenticated. return..");
        }
        else if (hasTriedToAuthenticate)
        {
            Debug.Log("LeaderboardController::tryToAuthenticate. hasTriedToAuthenticate. return..");
        }
        else
        {
            Debug.Log("LeaderboardController::tryToAuthenticate. AuthenticateToSocialPlatform");
            hasTriedToAuthenticate = true;
            LeaderboardManager.AuthenticateToSocialPlatform();
        }

    }


    // event listener functions
    void userAnsweredNagScreenEvent()
    {
        Debug.Log("LeaderboardController::UserAnsweredNagScreen");
        tryToReportScore();
    }

    void gameOverEvent()
    {
        Debug.Log("LeaderboardController::gameOverEvent");
        tryToReportScore();
    }

    void authenticationDoneEvent()
    {
        Debug.Log("LeaderboardController::authenticationDoneEvent");
        tryToReportScore();
    }
}
