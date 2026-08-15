function colormap() {
    for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

function del(){
    mv "$@" ~/.Trash
}

function fd(){
  selected_dir=$(
    find ~/repos ~/.dotfiles ~/Documents ~/Downloads \
    -maxdepth 1 -type d \
    \( -path ~/.dotfiles -o ! -name ".*" \) \
    -print | fzf)

    if [[ -z "$selected_dir" ]]; then
        return
    fi

    session_name=$(basename "$selected_dir")
    session_name=${session_name//./}

    if ! tmux has-session -t "$session_name" 2>/dev/null; then
      tmux new-session -d -s "$session_name" -c "$selected_dir"
    fi

    if [[ -z "${TMUX}" ]]; then
        tmux attach -t "$session_name"
    else
        tmux switch -t "$session_name"
    fi
}
