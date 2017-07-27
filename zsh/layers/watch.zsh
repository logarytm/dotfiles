function watch {
  local interval=1
  local errno
  local unused

  if [[ "$1" == -*? ]]; then
    interval=$2
    shift
    shift
  fi

  while true; do
    clear 1>&2
    echo "> $*" 1>&2
    eval $*
    errno=$?
    if [ $errno -ne 0 ]; then
      echo -e "$fg_bold[red]$@ exitted with code $errno$reset_color" 1>&2
      echo "Press ENTER to resume, Control-C to abort . . ." 1>&2
      read unused
    else
      sleep $interval
    fi
  done
}
