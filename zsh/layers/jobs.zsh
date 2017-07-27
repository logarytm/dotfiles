# run a long task, then ^Z and nwd to notify when it's done
function nwd {
  fg $@ && notify-send --icon utilities-terminal --urgency normal "Job finished" \
        || notify-send --icon dialog-error --urgency critical "Job failed with code $?"
}

# start a program in background
function start {
  nohup $* >>/dev/null 2>/dev/null &
}

# open in X11 and return to shell
function open {
  start xdg-open $*
}
