#!/bin/zsh

# Is CrowdStrke Falcon app installed?
if [[ -d /Applications/Falcon.app ]]; then
    Installed="Installed: Yes"
    
    # Check if CrowdStrike agent is running
    proc=$(ps aux | grep "com.crowdstrike.falcon.Agent" | /usr/bin/awk '{print $2}')
    if [ -z "$proc" ]; then
        procRunning="Process Running: No"
    else
        procRunning="Process Running: Yes"
    fi

    # Check CrowdStrike version
    Version=$(defaults read /Applications/Falcon.app/Contents/Info.plist CFBundleShortVersionString)

else
    Installed="Installed: No"
fi


# Results
echo "<result>$(printf '%s\n' "$Installed" "$procRunning" "Version: $Version")</result>"