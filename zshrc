if [[ "$OS" != '"centos"' ]]; then
  source $BOOTSTRAP_ZSH/os/linux.zsh
fi

if [[ -z $LANG ]] || [[ -z $LC_ALL ]]; then
  export LANG='en_US.UTF-8'
  export LC_ALL='en_US.UTF-8'
fi
export PODMAN_IGNORE_CGROUPSV1_WARNING=true
export TERM=xterm-256color xterm screen
export EDITOR=vim

source $BOOTSTRAP_ZSH/config/functions.zsh

if [[ -n $BOOTSTRAP_BASH ]] ; then
  export EDITOR=Editor
fi

if [[ -n $BOOTSTRAP_TMUX ]] ; then
  source $BOOTSTRAP_ZSH/config/tmux.zsh
fi

if [[ -n $BOOTSTRAP_VIM ]] || [[ -n $BOOTSTRAP_NVIM ]]; then
  source $BOOTSTRAP_ZSH/config/vim.zsh
fi

source $BOOTSTRAP_ZSH/config/alias.zsh

if [[ -n $BOOTSTRAP_WORK ]] ; then
  source $BOOTSTRAP_WORK/zshrc
fi

if [[ -n $BOOTSTRAP_CENTOS ]] && [[ -f $BOOTSTRAP_CENTOS/zshrc ]]; then
  source $BOOTSTRAP_CENTOS/zshrc
fi

# if [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]; then
#   eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# fi

command -v flux >/dev/null && . <(flux completion zsh)
command -v helm >/dev/null && . <(helm completion zsh)
command -v k3d >/dev/null && . <(k3d completion zsh)
if [[ $USER == "whynotea" ]]; then
	fpath=($BOOTSTRAP_ZSH/completions $fpath)
	tmuxinator_completion=$BOOTSTRAP_ZSH/completions/_tmuxinator
	if [[ ! -f $tmuxinator_completion ]]; then
		wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -O $tmuxinator_completion
	fi
fi

if [[ -n $WHYNOTEA_CMD ]]; then
  eval "$WHYNOTEA_CMD"
fi
source $BOOTSTRAP_ZSH/config/zsh.zsh
compdef _podman Podman
if [[ -n $BOOTSTRAP_WORK ]] ; then
  source $BOOTSTRAP_WORK/completion_links.zsh
fi
