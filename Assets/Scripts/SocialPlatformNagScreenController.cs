using Bananpiren.Secrets;
using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class SocialPlatformNagScreenController : MonoBehaviour
{
    public GameObject socialPlatformNagScreen;
    public Text headerText;

    bool hasTriedToAuthenticate = false;
    bool scoreHasBeenReported = false;
    bool coroutineStarted = false;


    public enum NagScreenState
    {
        GameIsNotOverSoDontShowModal,
        NoSocialCapabilitiesSoDontShowModal,
        AuthenticatedSoDontShowModal,
        NoNagSoDontShowModal,
        GamerDoesNotWantToDoItNow,
        ShowModalAndWaitForUserInput,
        TryToAuthenticate,
        WaitingForAuthenticationResult,
        AuthenticationFailed,
    };
    public NagScreenState nagScreenStateMachine = NagScreenState.AuthenticatedSoDontShowModal;

    private void Start()
    {
        string service;
        if ( PlatformHelperFunctions.isiOS() )
        {
            service = "Apple GameCenter";
        }
        else
        {
            service = "Google Play Console";
        }
        headerText.text = "Sharing your result is fun!\nWould you like to publish your result on " + service + "?";

        StartCoroutine(TryToReportScore());
    }
    void Update()
    {
        updateStateMachine();

        switch (nagScreenStateMachine)
        {
            case NagScreenState.ShowModalAndWaitForUserInput:
                socialPlatformNagScreen.SetActive(true);
                break;
            case NagScreenState.GameIsNotOverSoDontShowModal:
            case NagScreenState.AuthenticatedSoDontShowModal:
            case NagScreenState.NoNagSoDontShowModal:
            case NagScreenState.GamerDoesNotWantToDoItNow:
            default:
                socialPlatformNagScreen.SetActive(false);
                break;
        }

        if (!LeaderboardManager.ScoreHasBeenReported && !coroutineStarted && GameController.Instance.gameState == GameState.GameOver && GameController.Instance.numberOfCratesDelivered > 0)
        {
            coroutineStarted = true;
        }
    }

    IEnumerator TryToReportScore()
    {
        while (true)
        {
            if (!LeaderboardManager.ScoreHasBeenReported)
            {
                LeaderboardManager.ReportScore(GameController.Instance.numberOfCratesDelivered, SocialPlatformConstants.leaderBoardId);
                yield return new WaitForSeconds(2);
            }
            else
            {
                break;
            }
        }
    }

    void updateStateMachine()
    {
        if (GameController.Instance.gameState != GameState.GameOver)
        {
            nagScreenStateMachine = NagScreenState.GameIsNotOverSoDontShowModal;
        }
        else if (!PlatformHelperFunctions.hasSocialPlatformCapabilities())
        {
            nagScreenStateMachine = NagScreenState.NoSocialCapabilitiesSoDontShowModal;
        }
        else if (Social.localUser.authenticated)
        {
            nagScreenStateMachine = NagScreenState.AuthenticatedSoDontShowModal;
        }
        else if (PlayerPrefs.GetInt("GamerDoesNotWantToBeNaggedAboutSocialPlatform") == 1)
        {
            nagScreenStateMachine = NagScreenState.NoNagSoDontShowModal;
        }
        else if (nagScreenStateMachine == NagScreenState.GamerDoesNotWantToDoItNow)
        {
            // keep state
        }
        else if (nagScreenStateMachine == NagScreenState.TryToAuthenticate)
        {
            LeaderboardManager.AuthenticateToSocialPlatform();
            nagScreenStateMachine = NagScreenState.WaitingForAuthenticationResult;
            hasTriedToAuthenticate = true;
        }
        else if (nagScreenStateMachine == NagScreenState.WaitingForAuthenticationResult)
        {
            // keep state
        }
        else if (PlayerPrefs.GetInt("GamerDoesNotWantToBeNaggedAboutSocialPlatform") != 1)
        {
            nagScreenStateMachine = NagScreenState.ShowModalAndWaitForUserInput;
        }
        else
        {
            // keep state
        }
    }

    public void UserInputYes()
    {
        PlayerPrefs.SetInt("GamerDoesNotWantToBeNaggedAboutSocialPlatform", 0);
        nagScreenStateMachine = NagScreenState.TryToAuthenticate;
    }
    public void UserInputNotNow()
    {
        PlayerPrefs.SetInt("GamerDoesNotWantToBeNaggedAboutSocialPlatform", 0);
        nagScreenStateMachine = NagScreenState.GamerDoesNotWantToDoItNow;
    }
    public void UserInputNever()
    {
        PlayerPrefs.SetInt("GamerDoesNotWantToBeNaggedAboutSocialPlatform", 1);
        nagScreenStateMachine = NagScreenState.NoNagSoDontShowModal;
    }

}
