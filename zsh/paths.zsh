export EDITOR=nvim

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

export ZSH=$HOME/.oh-my-zsh
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

source $ZSH/oh-my-zsh.sh

[ -z "$TMUX" ] && export TERM=xterm-256color

export NODE_TLS_REJECT_UNAUTHORIZED=0

export UV="$HOME/.local/bin/env"

. "$HOME/.local/bin/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH="$PATH:/opt/nvim-linux-x86_64/bin:/usr/local/go/bin:$UV"

# bun completions
[ -s "/home/mariogarza/.bun/_bun" ] && source "/home/mariogarza/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

