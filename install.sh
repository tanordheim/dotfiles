#!/bin/sh

BASEDIR=$(pwd -P)

mkdir -p ~/.grc

# Git configuration
ln -sf $BASEDIR/gitignore_global ~/.gitignore_global
ln -sf $BASEDIR/gitconfig ~/.gitconfig

# Shell configuration
ln -sf $BASEDIR/zshrc ~/.zshrc

# tmux configuration
ln -sf $BASEDIR/tmux.conf ~/.tmux.conf
ln -sf $BASEDIR/tmux.theme.conf ~/.tmux.theme.conf

# GRC configuration
ln -sf $BASEDIR/grcconf ~/.grc/grc.conf
ln -sf $BASEDIR/grcgotestconf ~/.grc/conf.gotest

# Scripts
rm -rf ~/.scripts && ln -sf $BASEDIR/scripts ~/.scripts

# Ensure zshrc.local exists for local overrides
touch ~/.zshrc.local
