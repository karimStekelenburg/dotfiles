#!/usr/bin/env bash
echo "modes loaded"

LOG_FILE=./modes.logs

function init_default_mode() {
    echo "Entering default mode"
    . $HOME/.config/colors.sh

    borders active_color=${color["focused"]} inactive_color=${color["default_mode"]} width=10.0 style=round blur_radius=0.1 &
    yabai -m config active_window_opacity 1.0 normal_window_opacity 0.9
}

function init_wm_mode() {
    echo "Entering default mode"
    . $HOME/.config/colors.sh

    borders active_color=${color["focused"]} inactive_color=${color["wm_mode"]} width=10.0 style=round blur_radius=0.1 &
    yabai -m config active_window_opacity 1.0 normal_window_opacity 0.9
}
