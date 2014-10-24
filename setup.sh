#!/bin/bash

FILES="bash_logout bash_profile bashrc gitconfig gitignore tmux.conf vimrc"
DIRS="bash.d"
REPO=$PWD
mkdir -p old
cd $HOME

for f in $FILES $DIRS; do
  mv -v .$f $REPO/old/$f
done
for f in $FILES $DIRS; do
  ln -s $REPO/$f .$f
done
