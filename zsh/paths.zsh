export EDITOR=nvim

plugins=(git)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export ZSH=$HOME/.oh-my-zsh
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:/Users/mariogarza/go/bin"
