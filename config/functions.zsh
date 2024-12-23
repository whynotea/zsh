ns() {
  if [[ ! -z "$WHYNOTEA_WSL_NS" ]]; then
    echo "Already in ns"
    return 0
  fi
  if [[ ! -v WHYNOTEA_SYSTEMD ]]; then
    sudo /root/bootstrap	
  fi
  WHYNOTEA_WSL_NS=true /usr/local/bin/enterns TMUX=$TMUX TMUX_PANE=$TMUX_PANE WHYNOTEA_WSL_NS=true WHYNOTEA_CMD=clear zsh
}

