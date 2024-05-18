#!/bin/zsh
if command -v nvim &> /dev/null ; then
  if ! [[ $OS = \"centos\" ]]; then 
    alias vim="XDG_CONFIG_HOME=$BOOTSTRAP/include nvim"
    #vim ()
    #{
    #  XDG_CONFIG_HOME=$BOOTSTRAP/include nvim "$@"
    #}
  fi
fi
