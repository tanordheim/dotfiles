#!/bin/sh

BASEDIR=$(pwd -P)

if [ ! -d "$HOME/.zprezto" ]
then
  echo Installing zprezto
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
  for i in $(ls $HOME/.zprezto/runcoms/*)
  do
    FILENAME=$(basename $i)

    if [ "$FILENAME" != "README.md" ]
    then
      echo "Linking $i -> $HOME/.$FILENAME"
      ln -sf "$i" "$HOME/.$FILENAME"
    fi

  done
fi

mkdir -p ~/.grc

# Git configuration
ln -sf $BASEDIR/gitignore_global ~/.gitignore_global
ln -sf $BASEDIR/gitconfig ~/.gitconfig

# Shell configuration
ln -sf $BASEDIR/zpreztorc ~/.zpreztorc
ln -sf $BASEDIR/zshrc ~/.zshrc

# GRC configuration
ln -sf $BASEDIR/grcconf ~/.grc/grc.conf
ln -sf $BASEDIR/grcgotestconf ~/.grc/conf.gotest

# Scripts
rm -rf ~/.scripts && ln -sf $BASEDIR/scripts ~/.scripts

touch ~/.zshrc.local
