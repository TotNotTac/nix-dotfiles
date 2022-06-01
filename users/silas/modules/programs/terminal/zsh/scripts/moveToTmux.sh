#!/usr/bin/env zsh

function moveToTmux {
    set -m

    jobid=$(jobs % | awk '{print $NF}')
    name=$(jobs % | awk '{print $4}')

    echo "$jobid $name"

    bg

    disown "$name"

    tmux new-session -d -s temp
    tmux send-keys "reptyr $jobid" 'C-m'
    tmux select-window -t "temp:0"
}
