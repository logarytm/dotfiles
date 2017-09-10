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
