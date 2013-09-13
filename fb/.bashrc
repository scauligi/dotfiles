# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source Facebook definitions
if [ -f /mnt/vol/engshare/admin/scripts/master.bashrc ]; then
	. /mnt/vol/engshare/admin/scripts/master.bashrc
fi

function update()
{
  git sb
  git fetch origin
  git auto-rebase -n
  git parent
  yesno || return
  git auto-rebase
  arc build
}

alias resume='vi -S $(git rev-parse --abbrev-ref HEAD).vim'
alias ggraph='git log --decorate --all --graph $(git merge-base trunk $(git rev-parse --abbrev-ref HEAD))^..'
alias gg='ggraph --oneline --name-status'
alias gstat='git sb && gg'

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


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
