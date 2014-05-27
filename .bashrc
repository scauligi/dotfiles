# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac


# User specific aliases and functions

# Source local definitions
if [ -d $HOME/.bash.d ]; then
  for i in $HOME/.bash.d/*; do
    . "$i"
  done
fi

shopt -s checkwinsize

# Prevent PuTTY's (and possibly others') CTRL-S/CTRL-Q flow control
stty ixany -ixoff -ixon

# Aliases stolen from CSE
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias vi='vim'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
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


