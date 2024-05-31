#!/usr/bin/env bash

testScreatchPadIsAssigned() {
	. $HOME/.config/open-scratchpad-terminal.sh

	# stub
	query_assigned_scratchpad_window_id() {
		echo "window.id"
	}
	is_scratchpad_assigned
	echo "$?"
	assertTrue 'Expeted is_scratchpad_assigned to return true' '[ -eq $? 0 ]'
}

testScratchPadNotAssigned() {
	. $HOME/.config/open-scratchpad-terminal.sh
	query_assigned_scratchpad_window_id() {
		return 1
	}
	is_scratchpad_assigned
	echo [ -eq "$?" 1 ]
	assertFalse 'Expected is_scratchpad_assigned to return false' '[ -eq $? 1 ]'
}

# stub
setopt shwordsplit
. $HOME/.config/shunit2
