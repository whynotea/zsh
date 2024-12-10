export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8
export PODMAN_IGNORE_CGROUPSV1_WARNING=true
# Anaconda bug requires TERMINFO to be set: https://github.com/ContinuumIO/anaconda-issues/issues/331
export TERMINFO="/usr/share/terminfo"
export TERM=xterm-256color xterm screen
export EDITOR=vim

OS=`cat /etc/os-release | egrep ^ID=`
export OS=${OS#"ID="}

source $BOOTSTRAP_ZSH/config/paths
export PATH=$PATH_WHYNOTEA:$PATH_FEDORA

source $BOOTSTRAP_ZSH/config/wsl2.zsh
source $BOOTSTRAP_ZSH/config/functions.zsh
source $BOOTSTRAP_ZSH/config/zsh

if [[ -v BOOTSTRAP_BASH ]] ; then
  export EDITOR=Editor
fi

if [[ -v BOOTSTRAP_TMUX ]] ; then
 source $BOOTSTRAP_ZSH/config/tmux
fi

if [[ -v BOOTSTRAP_VIM ]] || [[ -v BOOTSTRAP_NVIM ]]; then
  source $BOOTSTRAP_ZSH/config/vim
fi

source $BOOTSTRAP_ZSH/config/alias

if [[ -v BOOTSTRAP_WORK ]] ; then
  source $BOOTSTRAP_WORK/zshrc
fi

if [[ -f ~/.github-token ]]; then
  export GH_TOKEN=$(cat ~/.github-token)
  echo https://whynotea:$GH_TOKEN@github.com > ~/.git-credentials
fi

if [[ -d $BOOTSTRAP_ZSH/completions ]]; then
  source $BOOTSTRAP_ZSH/completions/*
fi

if [[ -n $WHYNOTEA_CMD ]]; then
  eval "$WHYNOTEA_CMD"
fi

if [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
command -v flux >/dev/null && . <(flux completion zsh)
command -v helm >/dev/null && . <(helm completion zsh)
command -v helm >/dev/null && . <(k3d completion zsh)
