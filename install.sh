#!/bin/sh

SCRIPT=$(readlink -f "$0")
BASEDIR=$(dirname "$SCRIPT")

ln -sf $BASEDIR/gitignore_global ~/.gitignore_global
ln -sf $BASEDIR/gitconfig ~/.gitconfig
ln -sf $BASEDIR/zpreztorc ~/.zpreztorc
ln -sf $BASEDIR/zshrc ~/.zshrc

touch ~/.zshrc.local
