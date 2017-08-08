_last_bindkey=1

function bind_to_command {
  local kbd=$1
  shift
  local exe=$1
  local cmd=$@
  local fname="_bindkey_$_last_bindkey"

  eval "function $fname { BUFFER='$cmd'; zle accept-line; }"
  zle -N $fname
  bindkey $kbd $fname
  _last_bindkey=$((_last_bindkey+1))
}

function bind_to_prefix {
  local kbd=$1
  local prefix=$2
  local fname="_bindkey_$_last_bindkey"

  eval "function $fname { BUFFER='$prefix '; zle redisplay; zle end-of-line; }"
  zle -N $fname
  bindkey $kbd $fname
  _last_bindkey=$((_last_bindkey+1))
}
