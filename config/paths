if [[ -n $BOOTSTRAP_BASH ]]; then
	PATH_BOOTSTRAP_BASH=$BOOTSTRAP_BASH/bin:
fi
if [[ -z $PATH_ORIG ]]; then
	export PATH_ORIG=$PATH
fi
export GOPATH=$HOME/go
if [[ -d /usr/local/go/bin ]]; then
  PATH_GO=/usr/local/go/bin:$GOPATH/bin:
fi
if [[ -n $BOOTSTRAP_NVIM ]]; then
  PATH_NEOVIM=$BOOTSTRAP_NVIM/versions/nvim-linux64/bin:
fi
if [[ -d /usr/local/lib/nodejs/nodejs-latest/bin ]]; then
  PATH_NODE=/usr/local/lib/nodejs/nodejs-latest/bin:
fi
if [[ -d ${JAVA_HOME} ]]; then
  PATH_JAVA=${JAVA_HOME}/bin:${MAVEN_HOME}/bin:~/Applications/apache-maven-3.9.6/bin:
fi
PATH_WHYNOTEA=${PATH_BOOTSTRAP_BASH}${HOME}/bin:$HOME/.local/bin:${PATH_NEOVIM}${PATH_GO}${PATH_NODE}${PATH_JAVA}:

if [[ "$OS" == '"centos"' ]]; then
  PATH_CENTOS7=$HOME/whynotea/tmux/build/bin:$HOME/whynotea/zsh/build/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/opt/dell/srvadmin/sbin:/opt/dell/srvadmin/sbin:
else
  PATH_FEDORA=/usr/lib64/ccache:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:
fi
export PATH=${PATH_WHYNOTEA}${PATH_CENTOS7}${PATH_FEDORA}
