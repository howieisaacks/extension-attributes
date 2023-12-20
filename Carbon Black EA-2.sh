#!/bin/zsh

# Is Carbon Black installed?
if [[ "/Applications/VMware Carbon Black Cloud/VMware CBCloud.app" ]]; then
Installed="Installed: Yes"

	# Check if Carbon Black agent is running
	proc=$(ps aux | grep "com.vmware.carbonblack.cloud.ui" | /usr/bin/awk '{print $2}')
	if [ -z "$proc" ]; then
	procRunning="Process Running: No"
	else
	procRunning="Process Running: Yes"
	fi
	
# Check Carbon Black version
Version=$(defaults read "/Applications/VMware Carbon Black Cloud/VMware CBCloud.app/Contents/Info.plist" CFBundleShortVersionString)

else
    Installed="Installed: No"
fi

# Results
echo "<result>$(printf '%s\n' "$Installed" "$procRunning" "Version: $Version")</result>"