# packages
alias ni='npm install'
alias nig='npm install -g'
alias nis='npm install -S'
alias nid='npm install -D'
alias nug='npm uninstall -g'
alias nus='npm uninstall -S'
alias nud='npm uninstall -D'

# npm scripts
alias nrb='npm run build'
alias nrc='npm run clean'
alias nrl='npm run lint'
alias nrs='npm run start'
alias nrt='npm test'

# install packages in $HOME to avoid using sudo
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
