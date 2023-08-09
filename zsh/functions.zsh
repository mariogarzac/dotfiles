
function colormap() {
    for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

function del(){
    mv "$@" ~/.Trash
}

function tm(){
    session_name="moo"
    tmux new-session -A -s "$session_name"
}

function fd(){
    selected_dir=$(find ~/repos ~/Documents ~/Desktop ~/Downloads ~/.dotfiles -type d \( \
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
        \) -prune -o -type d -print | fzf)
 
    # Check if input is empty and exit if it is
    if [[ -z "$selected_dir" ]]; then
        return
    fi

    session_name=$(basename "$selected_dir")
    session_name=${session_name//./}

    # Check if the session already exists 
    if tmux ls | grep -q "$session_name"; then
        tmux switch -t "$session_name"
        return
    fi
    
    # Create the session
    tmux new-session -d -s "$session_name" -c "$selected_dir"

    # Switch or attach to the session
    if [[ -z "${TMUX}" ]]; then
        tmux attach -t "$session_name"
    else
        tmux switch -t "$session_name"
    fi
}

function ff(){
    session_name="quick"
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
 
    # Check if input is empty and exit if it is
    if [[ -z "$selected_file" ]]; then
        return
    fi

    # Get directory name and session name
    if tmux ls | grep -q "$session_name"; then
        tmux switch -t "$session_name"
    else
        tmux new-session -d -s "$session_name" -c "$(dirname $selected_file)"
        echo "$(basename $selected_file)"

        # Switch or attach to the session
        if [[ -z "${TMUX}" ]]; then
            tmux attach -t "$session_name"
        else
            tmux switch -t "$session_name"
        fi
    fi

    tmux send-keys -t "$session_name:1" "nvim '$(basename $selected_file)'" Enter
}
