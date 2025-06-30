# Check if we're on WSL and if so that we haven't yet entered the linux ns
if [[ -z "$WSL_DISTRO_NAME" && -z "$WHYNOTEA_WSL_NS" ]]; then
  # Not running on WSL
  return 0
fi

# Determine if SystemD is running as pid 1
SYSDPID=$(ps -eo cmd,pid | grep -m 1 ^/lib/systemd/systemd | awk '{print $2}')
if [[ -n "$WHYNOTEA_WSL_NS" ]] && [[ -n "$SYSDPID" ]] && [[ "$SYSDPID" == "1" ]]; then
  export WHYNOTEA_SYSTEMD=true
else
  if [[ -z "$WHYNOTEA_WSL_NS" ]]; then
    # Finally, add the WSL2 and Windows paths to the main PATH
    export PATH=$PATH:$PATH_ORIG
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LD_LIBRARY_PATH_ORIG
    export MANPATH=$MANPATH:$MANPATH_ORIG
  fi
fi

