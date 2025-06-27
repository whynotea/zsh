# Force zsh to always recheck its PATH for commands. Useful when new software is 
# installed.
zstyle ":completion:*:commands" rehash 1

ZSH_DISABLE_COMPFIX="true"

ZSH="${XDG_DATA_HOME}/oh-my-zsh"
# if [[ ! -a $ZSH ]]; then
#   git clone https://github.com/robbyrussell/oh-my-zsh.git $ZSH
# fi

#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_CONFIG_FILE="$BOOTSTRAP/.p10k.zsh"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
#DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$BOOTSTRAP_ZSH

# Remove the following line if not using plugins
source $BOOTSTRAP_ZSH/config/plugins/*

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-vi-mode)
# if command -v tmux &> /dev/null; then
#   plugins+=(tmux)
# fi
if command -v kubectl &> /dev/null; then
  plugins+=(kubectl)
fi
source $ZSH/oh-my-zsh.sh

# Cleans up directories used by zsh which are too open in permissions
compaudit &>/dev/null
if [[ $? -eq 1 ]]; then
  compaudit 2>/dev/null | xargs chmod g-w &>/dev/null
fi
autoload -Uz compinit && compinit -i &>/dev/null

