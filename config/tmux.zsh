#!/bin/zsh

export TMUX_TMPDIR=$BOOTSTRAP_TMUX/tmux_session

if [[ -n $TMUX ]]; then
  if [[ -n ${BOOTSTRAP_CENTOS} ]] && [[ -f ${BOOTSTRAP_CENTOS}/bin/tmux ]]; then
    $BOOTSTRAP_CENTOS/bin/tmux source $BOOTSTRAP_TMUX/tmux.conf
  else
    if [[ ! -d $BOOTSTRAP_TMUX/plugins/tpm ]]; then
      git clone --depth 1 https://github.com/tmux-plugins/tpm \
        $BOOTSTRAP_TMUX/plugins/tpm 2&>/dev/null
      tmux source $BOOTSTRAP_TMUX/tmux.conf
    fi
    $BOOTSTRAP_TMUX/plugins/tpm/scripts/install_plugins.sh &>/dev/null
    tmux source $BOOTSTRAP_TMUX/tmux.conf
  fi
fi
nts ()
{
 tmux new-session -d
 sleep 1
 tmux attach
}
