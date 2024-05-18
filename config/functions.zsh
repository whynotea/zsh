ns() {
	if [[ ! -v WHYNOTEA_SYSTEMD ]]; then
    sudo /root/bootstrap	
	fi
	WHYNOTEA_NS=true /usr/local/bin/enterns TMUX=$TMUX TMUX_PANE=$TMUX_PANE WHYNOTEA_CMD=clear zsh
}

