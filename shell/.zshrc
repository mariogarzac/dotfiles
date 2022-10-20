# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
ZSH_THEME="powerlevel10k/powerlevel10k"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
COLOR="grey"
[[ ! -f ~/.dotfiles/shell/.$COLOR.zsh ]] || source ~/.dotfiles/shell/.$COLOR.zsh
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

 Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh

source ~/.dotfiles/.aliases

eval $(/opt/homebrew/bin/brew shellenv)

# Use vim as the editor
export EDITOR=nvim

# Add to path
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"
export PATH="/Users/mariogarza/.spicetify:$PATH"
