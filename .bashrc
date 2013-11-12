# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias sml='rlwrap sml'
alias ssh-start='exec ssh-agent bash'
alias cdiff='diff_helper'
alias resume='vi -S $(git rev-parse --abbrev-ref HEAD).vim'
alias gg='git graph --oneline --name-status'

function diff_helper() {
  colordiff "$@" | less -R
}

function catf() {
  head -n -0 "$@"
}

function watcher()
{
  WATCHERTIME=$1
  WATCHERFILE=/tmp/watcher$$
  shift
  while true; do
    WATCHERHEIGHT=$(($(tput lines) - 3))
    ( eval $* ) | tail -n ${WATCHERHEIGHT} > ${WATCHERFILE} 2>/dev/null
    clear
    /bin/echo -n "Every ${WATCHERTIME} seconds - "
    date
    /bin/echo
    cat ${WATCHERFILE}
    \rm -f ${WATCHERFILE}
    /bin/echo
    /bin/echo "=="
    sleep ${WATCHERTIME}
  done
}

function yesno()
{
  read -p "Continue? (y/N): " -r
  if [[ $REPLY =~ ^[Yy] ]]
  then
    return 0
  fi
  return 1
}

