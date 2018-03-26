#!/bin/sh

BASEDIR=$(pwd -P)

mkdir -p ~/.grc
mkdir -p ~/.config/gtk-3.0

# Install base16-shell
if [ ! -d ~/.config/base16-shell ]
then
	git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
fi
touch ~/.config/base16

# Xorg/WM configuration
ln -sf $BASEDIR/Xresources ~/.Xresources
rm -rf ~/.config/bspwm && ln -sf $BASEDIR/bspwm ~/.config/bspwm
rm -rf ~/.config/sxhkd && ln -sf $BASEDIR/sxhkd ~/.config/sxhkd
rm -rf ~/.config/polybar && ln -sf $BASEDIR/polybar ~/.config/polybar
rm -rf ~/.config/compton && ln -sf $BASEDIR/compton ~/.config/compton

# Git configuration
ln -sf $BASEDIR/gitignore_global ~/.gitignore_global
ln -sf $BASEDIR/gitconfig ~/.gitconfig

# Shell configuration
ln -sf $BASEDIR/zshrc ~/.zshrc
rm -rf ~/.zsh && ln -sf $BASEDIR/zsh ~/.zsh
touch ~/.zshrc.local

# tmux configuration
ln -sf $BASEDIR/tmux.conf ~/.tmux.conf

# GRC configuration
ln -sf $BASEDIR/grcconf ~/.grc/grc.conf
ln -sf $BASEDIR/grcgotestconf ~/.grc/conf.gotest

# Termite configuration
rm -rf ~/.config/termite && ln -sf $BASEDIR/termite ~/.config/termite
ln -sf $BASEDIR/gtk-3.0/gtk.css ~/.config/gtk-3.0/gtk.css

# Scripts
rm -rf ~/.scripts && ln -sf $BASEDIR/scripts ~/.scripts

# Fonts
mkdir -p ~/.fonts && cp fonts/* ~/.fonts/
