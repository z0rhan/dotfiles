#!/bin/bash

# New tmux-session
tmux new-session -d -s $1

# Split vertically
tmux split-window -h -p 30 -t $1:0

# Create a new window
tmux new-window -t $1: -n 1

# Create new emacs-session inside the new window
tmux send-keys -t $1:1 'e' C-m

# Attach to the session created
tmux attach-session -t "$1":0.0

echo "New tmux session"
