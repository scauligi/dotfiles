#!/bin/bash

FILES="bash_logout bash_profile bashrc gitconfig gitignore tmux.conf vimrc"
DIRS="bash.d"
REPO=$PWD
OLD=`mktemp -d $PWD/oldXXX`

function yesno() {
  read -p "$1 (Y/n): " -r
  # bash return doesn't allow boolean zen :(
  if [[ $REPLY =~ ^[Nn] ]]
  then
    return 1
  fi
  return 0
}

read -p "Name: " -r
sed -i "s/<<NAME>>/$(echo $REPLY | sed -e 's/[\/&]/\\&/g')/" gitconfig
read -p "Email: " -r
sed -i "s/<<EMAIL>>/$(echo $REPLY | sed -e 's/[\/&]/\\&/g')/" gitconfig
sed -i "s/<<HOME>>/$(echo $HOME | sed -e 's/[\/&]/\\&/g')/" gitconfig

for f in $FILES $DIRS; do
  mv -v $HOME/.$f $OLD/$f
done
for f in $FILES $DIRS; do
  ln -s $REPO/$f $HOME/.$f
done

mkdir -v -p $HOME/.vim/swap
if [ ! -d $HOME/.vim/bundle/Vundle.vim ]
then
  if yesno "Download Vundle.vim?"
  then
    git clone https://github.com/gmarik/Vundle.vim $HOME/.vim/bundle/Vundle.vim
  fi
  yesno "Install vim bundles?" && vim +PluginInstall +qall
fi
