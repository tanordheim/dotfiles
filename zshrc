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
export GOPATH=~/Dev
export PATH="$PATH:$GOPATH/bin"

# Change TERM when SSH-ing since xterm-termite isn't usually supported remotely
alias ssh="TERM=xterm ssh"

c() { cd ~/Dev/src/github.com/$1; }
_c() { _files -W ~/Dev/src/github.com -/; }
compdef _c c

# Set by some git stuff
unalias gc
unalias grc

# Make sure we prefix git with noglob to avoid matching errors when using things
# like ^ and ~
alias git="noglob git"

# Wrap go commands in grc for colorization
alias go="grc go"

# Add some common go test aliases
alias gtu="go test -v -cover ./..." # Run go unit tests
alias gti="go test -v -tags=integration -cover ./..." # Run go integration tests
alias gt="gtu && gti" # Run all go tests

# Add the local scripts dir to PATH
export PATH="$PATH:$HOME/.scripts"

# Add the local bin dir to PATH
export PATH="$PATH:$HOME/.bin"

# Add some other common aliases
alias open="xdg-open"

# Configure terminal titles
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac
