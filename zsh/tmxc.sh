#!/bin/zsh

# Check if an argument was passed
if [ -z "$1" ]; then
    session_name="o_o"

elif [ "$1" = "." ]; then
    current_dir=$(pwd)

    # Extract the name of the current folder
    session_name=$(basename "$current_dir")
else
    session_name="$1"

fi

tmux new-session -d -s "$session_name"

# Add a new window to the session
tmux new-window -t "$session_name" 

# Attach to the Tmux session
tmux attach-session -t "$session_name" 
