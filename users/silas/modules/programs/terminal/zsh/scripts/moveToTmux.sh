#!/usr/bin/env zsh

function moveToTmux {
    set -m
    jobLine=$(jobs -l | tail -1)

    name=$(echo "$jobLine" | awk '{print $NF}')
    jobid=$(echo "$jobLine" | awk '{print $3}')

    echo "$jobid $name"

    bg

    disown "$name"

    tmux new-session -d -s temp
    tmux send-keys "reptyr $jobid" 'C-m'
    tmux attach
}
