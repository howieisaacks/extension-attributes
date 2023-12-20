#!/bin/zsh

# Is Global Protect installed?
if [[ -d /Applications/GlobalProtect.app ]]; then
Installed="Installed: Yes"
	
	# Check if Global Protect is running
	proc=$( ps aux | grep "com.paloaltonetworks.GlobalProtect.client.extension" | /usr/bin/awk '{print $2}')
	if [ -z "$proc" ]; then
	procRunning="Process Running: No"
	else
	procRunning="Process Running: Yes"
	fi

	# Check Global Protect version
	Version=$(defaults read /Applications/GlobalProtect.app/Contents/Info.plist CFBundleShortVersionString)

else
	Installed="Installed: No"
fi

# Results
echo "<result>$(printf '%s\n' "$Installed" "$procRunning" "Version: $Version")</result>"
