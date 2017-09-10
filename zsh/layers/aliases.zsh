# everyday aliases & defaults
alias ncdu='ncdu -2 -x'
alias rm='rm -v'
alias rmdir='rmdir -v'
alias rmd=rmdir
alias mkdir='mkdir -p'
alias mkd='mkdir'
alias ls='command ls --color=auto -1Ah --group-directories-first'
alias l='command ls --color=auto -Ah --group-directories-first'
alias ll='ls -lA'
alias lf='find . -maxdepth 1 \( -not -name .\* \) -type f -print0 | xargs -0r ls --color=auto -h'
alias http-serve="python3 -m http.server"

# inter-device mv(1)
alias imv='rsync -abmv --remove-source-files'

# avoid interpolation of special characters
alias curl='noglob curl'
alias wget='noglob wget'
alias find='noglob find'
