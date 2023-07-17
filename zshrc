export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8
export TERM=xterm-256color

source $BOOTSTRAP_ZSH/config/zsh

if [[ -v BOOTSTRAP_BASH ]] ; then
  export PATH=$BOOTSTRAP_BASH/bin:$PATH
fi

if [[ -v BOOTSTRAP_TMUX ]] ; then
 source $BOOTSTRAP_ZSH/config/tmux
fi

if [[ -v BOOTSTRAP_VIM ]] ; then
  source $BOOTSTRAP_ZSH/config/vim
fi

source $BOOTSTRAP_ZSH/config/alias
