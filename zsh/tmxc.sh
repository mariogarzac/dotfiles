#!/bin/zsh

n_flag=false
screen_count=1
session_name="moo"

if [[ -z "$1" ]]; then
    tmux new-session -d -s "$session_name"
    exit 0
fi

# Loop through args
while [[ $# -gt 0 ]]; do
   case "$1" in 
        -h)
          echo "usage: tmxc [empty | -h | -n | -s ]"
          echo "empty: will set "$session_name" as the session name."
          echo "-n . will set the session name to the current directory"
          echo "-n <name> will set the given name as session name."
          echo "if no name is provided, then it will set the current directory"
          echo "-s will add windows to the session"
          exit 0
          ;;

        -n) 
          shift
          if [[ "$1" == "." ]]; then
            # Extract the name of the current folder
            session_name=$(basename "$(pwd)")
          else
            session_name="$1"
          fi

          n_flag=true
          tmux new-session -d -s "$session_name"
          ;;

        -s) 
          shift
          if [[ "$n_flag" = false ]]; then
            # Extract the name of the current folder
            session_name=$(basename "$(pwd)")
            tmux new-session -d -s "$session_name"
          fi 

          while [[ screen_count -lt "$1" ]]; do
              tmux new-window -t "$session_name" 
              (( screen_count++ ))
          done
          ;;

        *)
          echo "Unkown option "$1" "
          echo "Available options are:"
          echo "-h for help"
          echo "-n to set a session name"
          echo "-s to set amount of windows"
          exit 0
          ;;
   esac
   shift
done
     

# Attach to the Tmux session
tmux attach-session -t "$session_name" 
