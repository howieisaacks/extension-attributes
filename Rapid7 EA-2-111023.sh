#!/bin/zsh

# Is Rapid7 installed?
if [ -f /opt/rapid7/ir_agent/components/insight_agent/common/agent.log ]; then
Installed="Installed: Yes"

	# Check if Rapid7 is running
	proc=$(ps aux | grep "ir_agent" | /usr/bin/awk '{print $2}')
	if [ -z "$proc" ]; then
	procRunning="Process Running: No"
	else
	procRunning="Process Running: Yes"
	fi

	# Check Rapid7 version
	Version=$(grep "Agent Info" /opt/rapid7/ir_agent/components/insight_agent/common/agent.log | tail -n1 | tr ' ' '
' | awk '/Version:/{getline; print}')

else
	Installed="Installed: No"
fi

# Results
echo "<result>$(printf '%s\n' "$Installed" "$procRunning" "$Version")</result>"