export EDITOR=nvim

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

[ -z "$TMUX" ] && export TERM=xterm-256color

export ZSH=$HOME/.oh-my-zsh
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:/usr/local/go/bin:/opt/nvim-linux-x86_64/bin"
