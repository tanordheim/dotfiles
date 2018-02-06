#!/bin/sh

BASEDIR=$(pwd -P)

mkdir -p ~/.grc

# Install base16-shell
if [ ! -d ~/.config/base16-shell ]
then
	git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
fi
touch ~/.config/base16

# Git configuration
ln -sf $BASEDIR/gitignore_global ~/.gitignore_global
ln -sf $BASEDIR/gitconfig ~/.gitconfig

# Shell configuration
ln -sf $BASEDIR/zshrc ~/.zshrc
ln -sf $BASEDIR/zsh ~/.zsh
touch ~/.zshrc.local

# tmux configuration
ln -sf $BASEDIR/tmux.conf ~/.tmux.conf

# GRC configuration
ln -sf $BASEDIR/grcconf ~/.grc/grc.conf
ln -sf $BASEDIR/grcgotestconf ~/.grc/conf.gotest

# Scripts
rm -rf ~/.scripts && ln -sf $BASEDIR/scripts ~/.scripts
