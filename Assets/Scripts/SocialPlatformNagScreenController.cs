using Bananpiren.Secrets;
using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class SocialPlatformNagScreenController : Singleton<SocialPlatformNagScreenController>
{
    #region Singleton<T> boilerplate
    protected override bool isGlobalScope
    {
        get
        {
            return false;
        }
    }
    void Awake()
    {
        // You MUST call the base class onAwake() method
        //	before you exit Awake().
        onAwake();
    }
    void OnDestroy()
    {
        base.onDestroy();
    }
    #endregion

    public GameObject socialPlatformNagScreen;
    public Text headerText;

    bool hasTriedToAuthenticate = false;
    bool scoreHasBeenReported = false;
    bool coroutineStarted = false;

    public event System.Action UserAnsweredNagScreen;


    public enum NagScreenState
    {
        GameIsNotOverSoDontShowModal,
        NoSocialCapabilitiesSoDontShowModal,
        AuthenticatedSoDontShowModal,
        NoNagSoDontShowModal,
        GamerDoesNotWantToDoItNow,
        ShowModalAndWaitForUserInput,
        UserHasGivenInput,
        WaitingForAuthenticationResult,
    };
    public NagScreenState nagScreenStateMachine = NagScreenState.AuthenticatedSoDontShowModal;

    void Start()
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

        // event listeners
        GameController.Instance.GameOverEvent += updateStateMachine;
        UserAnsweredNagScreen += updateStateMachine;

        // run state machine once on init
        updateStateMachine();
    }


    void updateStateMachine()
    {
        // state machine transitions
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


        // show or hide modal depending on state machine
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
    }

    public void UserInputYes()
    {
        PlayerPrefs.SetInt("GamerDoesNotWantToBeNaggedAboutSocialPlatform", 0);
        nagScreenStateMachine = NagScreenState.WaitingForAuthenticationResult;

        // fire event
        if (UserAnsweredNagScreen != null) UserAnsweredNagScreen();
    }
    public void UserInputNotNow()
    {
        PlayerPrefs.SetInt("GamerDoesNotWantToBeNaggedAboutSocialPlatform", 0);
        nagScreenStateMachine = NagScreenState.GamerDoesNotWantToDoItNow;

        // fire event
        if (UserAnsweredNagScreen != null) UserAnsweredNagScreen();
    }
    public void UserInputNever()
    {
        PlayerPrefs.SetInt("GamerDoesNotWantToBeNaggedAboutSocialPlatform", 1);
        nagScreenStateMachine = NagScreenState.NoNagSoDontShowModal;

        // fire event
        if (UserAnsweredNagScreen != null) UserAnsweredNagScreen();
    }

}
