# git
alias gc="git commit -m"
alias ga="git add"
alias gs="git status"
alias gp="git push"

# projects
alias py="cd ~/repos/Python/"
alias dnd="cd ~/Documents/Code/Python/Playground/5eEncounter-cli/"
alias walls="cd ~/repos/Wallpapers/walls"
alias wallupdate="python3 ~/repos/python/playground/copy.py > ~/repos/Wallpapers/README.md"

# utility
alias hist="history|grep"
alias cf="cfiles"
alias la="ls -alF"
alias vim="nvim"
alias c="clear"
alias thm="sudo openvpn ~/Documents/Network/THM/mariomoo.ovpn"

function del(){
  mv "$@" ~/.Trash
}
