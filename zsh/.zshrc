[[ ! -f ~/.dotfiles/zsh/theme.zsh ]] || source ~/.dotfiles/zsh/theme.zsh
[[ ! -f ~/.dotfiles/zsh/functions.zsh ]] || source ~/.dotfiles/zsh/functions.zsh
[[ ! -f ~/.dotfiles/zsh/paths.zsh ]] || source ~/.dotfiles/zsh/paths.zsh
[[ ! -f ~/.dotfiles/zsh/aliases.zsh ]] || source ~/.dotfiles/zsh/aliases.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(/opt/homebrew/bin/brew shellenv)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
