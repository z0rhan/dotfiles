#!/bin/bash

tmux new-session -d -s $1
tmux split-window -h -p 20 -t $1:0
tmux split-window -v -p 10 -t $1:0
tmux new-window -t $1: -n 1
tmux attach-session -t "$1"

echo "New tmux session"
