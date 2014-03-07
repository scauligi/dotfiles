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

shopt -s checkwinsize

export PATH
export LD_LIBRARY_PATH
export EDITOR
export FIGNORE

if [ -z "$TMUX" ]; then
  tmux list-sessions 2>/dev/null
  if [ "$HOSTNAME" == "agk.cs.washington.edu" ]; then
    tmux attach -t irssi
  fi
fi

