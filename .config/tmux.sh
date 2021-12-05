#!/usr/bin/env sh

if [ -z "$TMUX" ]; then
    base_session="${USER}_session"
    tmux has-session -t $base_session || tmux new-session -d -s $base_session
    tmux new-session -t $base_session \; set-option destroy-unattached 
fi
