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

mkdir -p ~/.config/i3 ~/.config/termite ~/.grc

# OS configuration
ln -sf $BASEDIR/yaourtrc ~/.yaourtrc

# Git configuration
ln -sf $BASEDIR/gitignore_global ~/.gitignore_global
ln -sf $BASEDIR/gitconfig ~/.gitconfig

# Shell configuration
ln -sf $BASEDIR/zpreztorc ~/.zpreztorc
ln -sf $BASEDIR/zshrc ~/.zshrc

# UI configuration
ln -sf $BASEDIR/xinitrc ~/.xinitrc
ln -sf $BASEDIR/Xresources ~/.Xresources
ln -sf $BASEDIR/i3/config ~/.config/i3/config
ln -sf $BASEDIR/i3/i3blocks.conf ~/.config/i3/i3blocks.conf
rm -rf ~/.config/i3/workspaces && ln -sf $BASEDIR/i3/workspaces ~/.config/i3/workspaces
ln -sf $BASEDIR/compton/compton.conf ~/.config/compton.conf
rm -rf ~/.i3blocks && ln -sf $BASEDIR/i3/blocks ~/.i3blocks
ln -sf $BASEDIR/termite/config ~/.config/termite/config
ln -sf $BASEDIR/libinput/libinput-gestures.conf ~/.config/libinput-gestures.conf

# GRC configuration
ln -sf $BASEDIR/grcconf ~/.grc/grc.conf
ln -sf $BASEDIR/grcgotestconf ~/.grc/conf.gotest

touch ~/.zshrc.local
