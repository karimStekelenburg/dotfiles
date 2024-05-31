#!/usr/bin/env bash

# Enable job control
# set -o monitor

# Function to wrap other functions and log their exit status
function monitor() {
	local func="$1"
	shift
	"$func" "$@"
	local exit_code=$?
	echo "Function $func exited with code $exit_code"
	return $exit_code
}

cleanup() {
	echo "Cleaning up..."
	rm -f /tmp/tempfile
}

open_iterm_scratchpad() {
	osascript <<EOF
    tell application "iterm"
        set windowexists to false
        repeat with w in windows
            if (current session of w)'s profile name is "scratchpad" then
                set windowexists to true
                tell w to activate
                exit repeat
            end if
        end repeat

        if not windowexists then
            create window with profile "scratchpad"
        end if
    end tell
EOF
}

scratchpad_window_id() {
	yabai -m query --windows | jq -r '.[] | select(.app == "iTerm2" and (.title == "scratchpad" or .scratchpad == "iterm")) | .id'
}

set_scratchpad() {
	window_id = $(scratchpad_window_id)
	echo $window_id
	yabai -m window $window_id --scratchpad iterm
}

query_assigned_scratchpad_window_id() {
	yabai -m query --windows | jq -r '.[] | select(.scratchpad == "iterm") | .id'
}

is_scratchpad_assigned() {
	if [ -n "$(query_assigned_scratchpad_window_id)" ]; then
		return 0 # true
	else
		return 1 # false
	fi
}

# 1. Check wether a scratchpad with the name "terminal" exists
#   IF TRUE
#       Focus the window
#       Return
#   If FALSE
#       Check wether a terminal window with title "scratchpad" exists
#           IF TRUE
#               Assign "terminal" scratchpad to that window
#               Focus the window
#               Return
#           IF FALSE
#               Create a new iTerm window with the "scratchpad" profile (applescript)
#                   (this will set the window title to "scratchpad")
#               Query the window.id of an iTerm window titled "scratchpad"
#               Assign scratchpad="terminal" to fetched window.id
#               Focus the window
#               Return
