# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$HOME/bin:$PATH
LD_LIBRARY_PATH=$HOME/lib:$LD_LIBRARY_PATH
EDITOR=vim

shopt -s checkwinsize

export PATH
export LD_LIBRARY_PATH
export EDITOR
