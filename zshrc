export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

# Anaconda bug requires TERMINFO to be set: https://github.com/ContinuumIO/anaconda-issues/issues/331
export TERMINFO="/usr/share/terminfo"

NODE_PATH=/usr/local/lib/nodejs/nodejs-latest/bin
GO_PATH=/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GO_PATH:$GOPATH/bin:$NODE_PATH

source $BOOTSTRAP_ZSH/config/zsh

if [[ -v BOOTSTRAP_BASH ]] ; then
  export PATH=$BOOTSTRAP_BASH/bin:$PATH
fi

if [[ -v BOOTSTRAP_TMUX ]] ; then
 source $BOOTSTRAP_ZSH/config/tmux
fi

if [[ -v BOOTSTRAP_VIM ]] || [[ -v BOOTSTRAP_NVIM ]]; then
  source $BOOTSTRAP_ZSH/config/vim
fi

source $BOOTSTRAP_ZSH/config/alias
