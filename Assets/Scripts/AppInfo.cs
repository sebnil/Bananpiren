﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public static class AppInfo
{
    public static bool DebugRelease = false; // no ability for time to run out, show buttons to give more time etc
    public static bool SemiDebugRelease = true; // show native logger
    public static bool EnableRemoteLogging = true; // send log files to google spreadsheet
}
