# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Prevent PuTTY's (and possibly others') CTRL-S/CTRL-Q flow control
stty ixany -ixoff -ixon

# User specific aliases and functions
alias abstract='cd /homes/abstract/sunjayc/public_html'
alias tasks='vi /homes/abstract/sunjayc/public_html/txt_scripts/tasks.txt'
alias sml='rlwrap sml'
alias racket='rlwrap racket'
alias ssh-start='exec ssh-agent bash'
alias resume='vi -S $(git rev-parse --abbrev-ref HEAD).vim'
alias gg='git graph --oneline --name-status'
alias qcc='gcc -Wall -g -std=gnu99'
alias q++='g++ -Wall -g -std=gnu++11'

function crontab() {
  if [ $# -eq 0 ]; then
    echo "no"
  else
    command crontab "$@"
  fi
}

function mkd() {
  mkdir -vp "$@" && cd $_
}

function findtmux() {
  for attu in attu1 attu2 attu3 attu4
  do
    echo $attu:
    ssh $attu "~/bin/tmux list-sessions" 2>/dev/null
  done
}

function cdiff() {
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


