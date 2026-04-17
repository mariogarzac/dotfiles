export EDITOR=nvim

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

[ -z "$TMUX" ] && export TERM=xterm-256color

export ZSH=$HOME/.oh-my-zsh
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

source $ZSH/oh-my-zsh.sh

export GOPATH=$HOME/.local/share/go

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

export PATH="$PATH:$GOPATH/bin/:/usr/local/:$HOME/.spicetify"
