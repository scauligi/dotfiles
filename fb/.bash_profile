# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=/data/users/sunjayc/bin:$PATH:$HOME/bin
LD_LIBRARY_PATH=/data/users/sunjayc/lib:$LD_LIBRARY_PATH
EDITOR=vim

shopt -s checkwinsize

export PATH
export LD_LIBRARY_PATH
export EDITOR
unset USERNAME
source "$ADMIN_SCRIPTS/ssh/manage_rootcanal.sh"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
