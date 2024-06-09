
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
    selected_dir=$(find ~/repos ~/Desktop ~/Downloads ~/.dotfiles -type d \( \
        -name '.obsidian' \
        -o -name 'cheat-sheet' \
        -o -name 'Obsidian' \
        -o -name 'minecraft' \
        -o -name 'School' \
        -o -name '.git' \
        -o -name 'lib' \
        -o -name 'bin' \
        -o -name 'node_modules' \
        -o -name '_resources' \
        -o -name 'Labs' \
        -o -name 'DND' \
        -o -name 'Network' \
        -o -name 'Library' \
        -o -name 'Unity' \
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

function bs() {
    file=$(find . -type d \( \
        -name '.obsidian' \
        -o -name '.git' \
        -o -name '_resources' \
        -o -name 'Cybersecurity' \
        \) -prune -o -type f ! -name '.DS_Store' -print | fzf)

    if [[ -z "$file" ]]; then
        return
    fi

    tmux new-window -d -c "$(dirname "$file")" -n "$window_name"
    tmux select-window -t "$window_name" \; send-keys "vim \"$(basename "$file")\"" Enter
}
