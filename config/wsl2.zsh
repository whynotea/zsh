if [[ -z "$WSL_DISTRO_NAME" && -z "$WHYNOTEA_WSL_NS" ]]; then
  # Not running on WSL
  return 0
fi

# Determine if SystemD is running as pid 1
SYSDPID=$(ps -eo cmd,pid | grep -m 1 ^/lib/systemd/systemd | awk '{print $2}')
if [[ ! -z "$SYSDPID" ]] && [[ "$SYSDPID" == "1" ]]; then
  export WHYNOTEA_SYSTEMD=true
else
  # The following checks if systemd is running as a pid other than 1
  ps -ef | grep -v grep | grep -q systemd
  if [[ $? == 0 ]]; then
    if command -v podman &> /dev/null; then
      # If it is running, then check if podman returns an error
      podman ps &> /dev/null
      if [[ $? != 0 ]]; then
        # If it is returning an error then try running system migrate
        podman system migrate
      fi
    fi
  fi
  if [[ -z "$WHYNOTEA_WSL_NS" ]]; then
    # Finally, add the WSL2 and Windows paths to the main PATH
    export PATH=$PATH:$PATH_WSL2:$PATH_WINDOWS
  fi
fi

