#!/bin/zsh

# Select a file but ignore the directories below
selected_file=$(find ~/repos ~/Documents ~/Desktop ~/Downloads ~/.dotfiles -type d \( \
  -name '.obsidian' \
  -o -name '.git' \
  -o -name 'node_modules' \
  -o -name 'lib' \
  -o -name 'bin' \
  -o -name '_resources' \
  -o -name '*Cisco*' \
  \) -prune -o -type f -print | fzf )


# Check if input is empty and exit if it is
if [[ -z "$selected_file" ]]; then
    exit 0
fi

# Check file extension
file_extension="${selected_file##*.}"

# Check if selected file is a pdf 
if [[ $file_extension == "pdf" ]]; then
    open "$selected_file"
    exit 0
fi

# Get directory name and session name
directory=$(dirname "$selected_file")
session_name=$(echo "$directory" | awk -F'repos/' '{print $2}' | awk -F'/' '{print $1}')

# Check if session name is empty
if [[ -z "$session_name" ]]; then

    # If session name is empty then get the directory name after the username
    session_name=$(echo "$directory" | awk -F $(whoami)'/' '{print $2}' | awk -F '/' '{print $1}')

    # remove the . if there are any
    session_name=$(echo "$session_name" | sed s/\.//)
fi

# Check if the session already exists
if tmux ls | grep -q "$session_name"; then
    tmux switch-client -t "$session_name"
    exit 0
fi

# Change into file's directory
cd "$directory"

# Create new session
tmux new-session -d -s "$session_name"

# If . was not passed as an argument, then open the file in vim
if [[ "$1" != "." ]]; then
        tmux send-keys -t "$session_name:1" "nvim '$selected_file'" Enter
fi

# Switch to the new session
tmux switch-client -t "$session_name"
