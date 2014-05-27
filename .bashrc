# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Source local definitions
if [ -d $HOME/.bash.d ]; then
  for i in $HOME/.bash.d/*; do
    . "$i"
  done
fi

# User specific aliases and functions
alias ssh-start='SSH_BASH=1 exec ssh-agent bash -l'
alias resume='vi -S $(git rev-parse --abbrev-ref HEAD).vim'
alias gg='git graph --oneline --name-status'
alias qcc='gcc -Wall -g -std=gnu99'
alias q++='g++ -Wall -g -std=gnu++11'

function grepl() {
  grep "$@" --color=always | less -R
}

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


