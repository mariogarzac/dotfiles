
function colormap() {
    for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

function del(){
    mv "$@" ~/.Trash
}

function fd(){
    selected_file=$(find ~/repos ~/Documents ~/Desktop ~/Downloads ~/.dotfiles -type d \( \
        -name '.obsidian' \
        -o -name '.git' \
        -o -name 'lib' \
        -o -name 'bin' \
        -o -name 'node_modules' \
        -o -name 'Obsidian' \
        -o -name '_resources' \
        -o -name 'Labs' \
        -o -name 'DND' \
        -o -name 'Network' \
        -o -name 'Library' \
        -o -name 'Wallpapers' \
        -o -name '*Cisco*' \
        \) -prune -o -type f -print | fzf)

    # --preview "echo {} | grep -o '$(read -r input && echo $input)'"
    # Check if input is empty and exit if it is
    if [[ -z "$selected_file" ]]; then
        return
    fi

    # Check file extension
    file_extension="${selected_file##*.}"

    # Check if selected file is a pdf 
    if [[ $file_extension == "pdf" ]]; then
        open "$selected_file"
        return
    fi

    ## Change this to set selected name not directory after code

    # Get directory name and session name
    directory=$(dirname "$selected_file")
    session_name=$(echo "$directory" | awk -F'Code/' '{print $2}' | awk -F'/' '{print $1}')

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
        return
    fi

    # Change into file's directory
    cd "$directory"

    # Create new session
    tmux new-session -d -s "$session_name"

    # If . was not passed as an argument, then open the file in vim
    # if [[ "$1" != "." ]]; then
    #     tmux send-keys -t "$session_name:1" "nvim '$selected_file'" Enter
    # fi
    
    # Switch to the new session
    tmux switch-client -t "$session_name"
        
}

function tm(){
    n_flag=false
    screen_count=1
    session_name="moo"

    if [[ -z "$1" ]]; then
        tmux new-session -d -s "$session_name"
        tmux attach-session -t "$session_name" 
        return
    fi

    # Loop through args
    while [[ $# -gt 0 ]]; do
        case "$1" in 
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
        esac
        shift
    done

    # Attach to the Tmux session
    tmux attach-session -t "$session_name" 

}
