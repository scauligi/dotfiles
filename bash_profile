# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi


# User specific environment and startup programs

PATH=$PATH:$HOME/bin
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/lib
if [ -z "$MANPATH" ]; then
  MANPATH=$(manpath):$HOME/man
else
  MANPATH=$MANPATH:$HOME/man
fi
EDITOR=vim
FIGNORE=.class:$FIGNORE

export PATH
export LD_LIBRARY_PATH
export EDITOR
export FIGNORE
#export GIT_PS1_SHOWDIRTYSTATE="yes"
export GIT_PS1_SHOWSTASHSTATE="yes"
#export GIT_PS1_SHOWUNTRACKEDFILES="yes"
export GIT_PS1_SHOWCOLORHINTS="yes"
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_STATESEPARATOR=""
export PROMPT_COMMAND='__git_ps1 "[" "\u@\h \W]$ " "%s "'

if [ -z "$TMUX" ]; then
  tmux list-sessions 2>/dev/null
fi

