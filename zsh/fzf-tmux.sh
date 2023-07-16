#!/bin/zsh

selected_file=$(find ~/repos ~/Documents ~/Desktop ~/Downloads -type d \( \
  -name '.obsidian' \
  -o -name '.git' \
  -o -name 'node_modules' \
  -o -name 'lib' \
  -o -name 'bin' \
  -o -name '_resources' \
  -o -name '*Cisco*' \
  \) -prune -o -type f -print | fzf )

file_extension="${selected_file##*.}"

if [[ $file_extension == "pdf" ]]; then
    open "$selected_file"
else
    directory=$(dirname "$selected_file")
    session_name=$(echo "$directory" | awk -F'repos/' '{print $2}' | awk -F'/' '{print $1}')

    cd "$directory"
    tmux new-session -d -s "$session_name"
    tmux send-keys -t "$session_name:1" "nvim '$selected_file'" Enter
    tmux switch-client -t "$session_name"
fi
