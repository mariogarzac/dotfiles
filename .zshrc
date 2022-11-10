[[ ! -f ~/.dotfiles/zsh/power.zsh ]] || source ~/.dotfiles/zsh/power.zsh
[[ ! -f ~/.dotfiles/zsh/aliases.zsh ]] || source ~/.dotfiles/zsh/aliases.zsh
[[ ! -f ~/.dotfiles/zsh/functions.zsh ]] || source ~/.dotfiles/zsh/functions.zsh
[[ ! -f ~/.dotfiles/zsh/paths.zsh ]] || source ~/.dotfiles/zsh/paths.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

plugins=(git zsh-syntax-highlighting )
eval $(/opt/homebrew/bin/brew shellenv)
