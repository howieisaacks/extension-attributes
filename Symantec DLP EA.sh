#!/bin/zsh


# Is Symantec DLP installed?
if [[ -d "/Library/Manufacturer/Endpoint Agent/Symantec.app" ]]; then
Installed="Installed: Yes"

	# Check if Symantec DLP is running
	proc=$(ps aux | grep "edpa" | /usr/bin/awk '{print $2}')
	if [ -z "$proc" ]; then
		procRunning="Process Running: No"
		else
		procRunning="Process Running: Yes"
	fi
	#Check Symantec DLP version
	Version=$(defaults read "/Library/Manufacturer/Endpoint Agent/Symantec.app/Contents/Info.plist" CFBundleShortVersionString)
else
	Installed="Installed: No"
fi

# Results
echo "<result>$(printf '%s\n' "$Installed" "$procRunning" "Version: $Version")</result>"