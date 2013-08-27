# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/lib
EDITOR=vim

shopt -s checkwinsize

export PATH
export LD_LIBRARY_PATH
export EDITOR

