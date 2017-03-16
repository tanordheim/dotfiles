# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Local zsh configuration
if [[ -s "${ZDOTDIR:-$HOME}/.zshrc.local" ]]; then
  source "${ZDOTDIR:-$HOME}/.zshrc.local"
fi

# Set editor
export EDITOR=vim

# Configure golang environment
export GOPATH=~/gocode
export PATH="$PATH:$GOPATH/bin"

c() { cd ~/Dev/src/github.com/$1; }
_c() { _files -W ~/Dev/src/github.com -/; }
compdef _c c

# Set by some git stuff
unalias gc

# Make sure we prefix git with noglob to avoid matching errors when using things
# like ^ and ~
alias git="noglob git"

# Configure terminal titles
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac
