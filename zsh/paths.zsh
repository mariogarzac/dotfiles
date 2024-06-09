export EDITOR=nvim

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

export ZSH=$HOME/.oh-my-zsh
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:$HOME/go/bin"
