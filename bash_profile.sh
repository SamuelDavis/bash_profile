#!/usr/bin/env bash
# EXPORTS
export PATH="/usr/local/sbin:$PATH"

# ALIASES
alias resource="source ~/.bash_profile"

# PROMPT HELPERS
function ref(){
    git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/\1/" || return
}

function sha(){
    git rev-parse --short HEAD 2> /dev/null | sed -e "s/\(.*\)/\[\1\]/" || return
}

function dateOut() {
    date +%H:%M || return
}

# STYLE
RED="\[\e[0;31m\]"
YELLOW="\[\e[0;33m\]"
GREEN="\[\e[0;32m\]"
WHITE="\[\e[0;37m\]"

PS1="$GREEN[\$(dateOut)]$YELLOW[\$(ref)]\$(sha)\[\e[0m\][\w]\$ "

if [ -f ./.bash_private ]; then
    source ./.bash_private
fi

