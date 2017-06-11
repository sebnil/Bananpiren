using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


class PlatformHelperFunctions
{
    public static bool isEditor()
    {
#if UNITY_EDITOR
        return true;
#else
	return false;
#endif
    }

    public static bool isiOS()
    {
#if UNITY_IPHONE
	return true;
#else
        return false;
#endif
    }

    public static bool isAndroid()
    {
#if UNITY_ANDROID
	return true;
#else
        return false;
#endif
    }

    public static bool isMobile()
    {
#if UNITY_ANDROID
	return true;
#elif UNITY_IPHONE
	return true;
#else
        return false;
#endif
    }

    public static bool hasSocialPlatformCapabilities()
    {
#if UNITY_ANDROID
	return true;
#elif UNITY_IPHONE
	return true;
#else
        return false;
#endif
    }

    public static bool hasKeyboard()
    {
        if (isMobile())
        {
            return false;
        }
        else
        {
            return false;
        }
    }
}
