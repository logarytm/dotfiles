if ! [ "$avoid_sourcing" ]; then
  autoload -Uz compinit
  if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
    compinit
  else
    compinit -C
  fi
fi

autoload colors && colors
autoload prompt && prompt off
zmodload zsh/regex
zmodload zsh/complist


function source_if_exists {
  for f in $@; do
    if [ -f $f ]; then
      source $f
    fi
  done
}

function source_unless {
  if [ "$(eval 'echo $'$1)" ]; then
    return 0
  fi
  shift
  for f in $@; do
    source $f
  done
}

zsh=${XDG_CONFIG_HOME-$HOME/.config}/zsh
source_if_exists $zsh/custom/pre.zsh

[ -f ~/.dircolors ] && eval "$(dircolors ~/.dircolors)"

fpath=($zsh/plugins/zsh-completions/src \
  $zsh/plugins/zsh-history-substring-search \
  $zsh/plugins/zsh-async \
  $zsh/plugins/zsh-manydots-magic \
  $fpath)

if ! [ "$plugins_loaded" ]; then
  source $zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
  FAST_HIGHLIGHT_STYLES[variable]=""
  source $zsh/plugins/zsh-async/async.zsh
  source $zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
  source_unless disable_powerlevel9k $zsh/plugins/powerlevel9k/powerlevel9k.zsh-theme

  plugins_loaded=1
fi

autoload -Uz manydots-magic && manydots-magic
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# zsh options
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
RPROMPT=
WORDCHARS=
bindkey -e
bindkey '^[[Z' reverse-menu-complete # Shift-Tab to cycle backwards
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
setopt appendhistory autocd extendedglob nomatch \
  notify promptsubst cdablevars alwaystoend rcquotes nobeep

autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# set preferred editor
export EDITOR=$(which nvim)
export VISUAL=$EDITOR

# config files
alias editor=$EDITOR
alias vimconfig='editor $HOME/.config/nvim/init.vim'
alias zshconfig='(cd $zsh && editor init.zsh)'

# load local config and everything from .zshrc.d
for file in $zsh/layers/*.zsh; do source $file; done
source_if_exists $zsh/custom/post.zsh

BASE16_SHELL=$HOME/.config/base16-shell/
if [ -d "$BASE16_SHELL" ]; then
  [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
fi

# disable interrupt data flow (aka ^S/^Q)
[ "$TTY" ] && stty -ixon
