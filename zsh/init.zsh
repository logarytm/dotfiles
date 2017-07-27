autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
autoload colors && colors
zmodload zsh/regex
zmodload zsh/complist

zsh=${XDG_CONFIG_HOME-$HOME/.config}/zsh

[ -f ~/.dircolors ] && eval "$(dircolors ~/.dircolors)"

fpath=($zsh/plugins/zsh-completions/src \
  $zsh/plugins/zsh-syntax-highlighting \
  $zsh/plugins/zsh-history-substring-search \
  $zsh/plugins/z \
  $zsh/plugins/zsh-async \
  $zsh/plugins/zsh-manydots-magic \
  $fpath)

DEFAULT_USER=og
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_OK_BACKGROUND=238
POWERLEVEL9K_STATUS_OK_FOREGROUND=green # 246
POWERLEVEL9K_STATUS_ERROR_BACKGROUND=$POWERLEVEL9K_STATUS_OK_BACKGROUND
POWERLEVEL9K_OK_ICON=✔
POWERLEVEL9K_FAIL_ICON=✘

POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=242
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=21
POWERLEVEL9K_DIR_HOME_BACKGROUND=$POWERLEVEL9K_DIR_DEFAULT_BACKGROUND
POWERLEVEL9K_DIR_HOME_FOREGROUND=$POWERLEVEL9K_DIR_DEFAULT_FOREGROUND
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=$POWERLEVEL9K_DIR_DEFAULT_BACKGROUND
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=$POWERLEVEL9K_DIR_DEFAULT_FOREGROUND
POWERLEVEL9K_DIR_PATH_SEPARATOR=' %F{248}%F{white} '
POWERLEVEL9K_VCS_BRANCH_ICON=' '

if ! [ "$plugins_loaded" ]; then
  source $zsh/plugins/zsh-async/async.zsh
  source $zsh/plugins/powerlevel9k/powerlevel9k.zsh-theme
  source $zsh/plugins/z/z.sh
  source $zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
  source $zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  plugins_loaded=1
fi

autoload -Uz manydots-magic && manydots-magic
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# zsh options
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
WORDCHARS=
bindkey -e
bindkey '^[[Z' reverse-menu-complete # Shift-Tab to cycle backwards
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
setopt appendhistory autocd extendedglob nomatch \
  notify promptsubst cdablevars alwaystoend
unsetopt beep

zstyle ':completion:*' auto-description '%d'
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' format "%F{8}%d »%f"
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z_-}={A-Za-z-_}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=2
zstyle ':completion:*' prompt '%e'
zstyle ':completion:*' select-prompt %S%l%s
zstyle ':completion:*' substitute 1
zstyle ':completion:*' use-compctl true
# complete directories when tabbing at empty shell
zstyle ':completion:*' insert-tab false
zstyle -e ':completion::complete:-command-:: tag-order' 'if [[ -z $BUFFER ]]; then reply=(local-directories -); fi'
zstyle -e ':completion::complete:git-checkout:argument-rest:headrefs' command "git for-each-ref --format='%(refname)' refs/heads 2>/dev/null"
# use LS_COLORS in file completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav cups daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'

autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# set preferred editor
export EDITOR=$(which nvim)
export VISUAL=$EDITOR

# config files
alias editor=$EDITOR
alias vimconfig='editor $HOME/.config/nvim/init.vim'
alias zshconfig='nvim -O $zdir/ $HOME/.zshrc.local'

# everyday aliases & defaults
alias ncdu='ncdu -2 -x'
alias rm='rm -v'
alias rmdir='rmdir -v'
alias rmd=rmdir
alias mkdir='mkdir -p'
alias mkd='mkdir'
alias ls='ls --color=auto -Ah --group-directories-first'
alias l='ls -1A'
alias ll='ls -lA'
# inter-device mv(1)
alias imv='rsync -abmv --remove-source-files'
alias http-serve="python3 -m http.server"

# avoid interpolation of special characters
alias curl='noglob curl'
alias wget='noglob wget'
alias find='noglob find'

# load local config and everything from .zshrc.d
[ -f $zsh/.init.zsh.local ] && source ~/.zshrc.local
for file in $zsh/layers/*.zsh; do source $file; done

BASE16_SHELL=$HOME/.config/base16-shell/
if [ -d "$BASE16_SHELL" ]; then
  [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
fi
