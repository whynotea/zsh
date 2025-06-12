OS=$(cat /etc/os-release | egrep ^ID=)
export OS=${OS#"ID="}

if [[ "$OS" == '"centos"' ]]; then
  source $BOOTSTRAP_ZSH/os/centos.zsh
else
  source $BOOTSTRAP_ZSH/os/linux.zsh
fi

export PODMAN_IGNORE_CGROUPSV1_WARNING=true
export TERM=xterm-256color xterm screen
export EDITOR=vim

source $BOOTSTRAP_ZSH/config/paths.zsh
source $BOOTSTRAP_ZSH/config/wsl2.zsh
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

## if [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]; then
##   eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
## fi

command -v flux >/dev/null && . <(flux completion zsh)
command -v helm >/dev/null && . <(helm completion zsh)
command -v k3d >/dev/null && . <(k3d completion zsh)

if [[ -n $WHYNOTEA_CMD ]]; then
  eval "$WHYNOTEA_CMD"
fi
zstyle ':completion:*:options' insert-equals true
source $BOOTSTRAP_ZSH/config/zsh.zsh
if [[ -n $BOOTSTRAP_WORK ]] ; then
  source $BOOTSTRAP_WORK/completion_links.zsh
fi