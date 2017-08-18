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
alias gtu="go test -v -cover \$(go list ./... | grep -v /vendor/)" # Run go unit tests
alias gti="go test -v -tags=integration -cover \$(go list ./... | grep -v /vendor/)" # Run go integration tests
alias gt="gtu && gti" # Run all go tests

# Add the local scripts dir to PATH
export PATH="$PATH:$HOME/.scripts"

# Configure terminal titles
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac

# Windows Linux Subsystem convenience settings
WSL_ENABLED=$(cat /proc/sys/kernel/osrelease | grep Microsoft)
if [ ! -z "$WSL_ENABLED" ]
then
	alias dotnet="/mnt/c/Program\ Files/dotnet/dotnet.exe"
	alias node="/mnt/c/Program\ Files/nodejs/node.exe"
	alias npm="/mnt/c/Program\ Files/nodejs/node.exe C:\\\Program\ Files\\\nodejs\\\node_modules\\\npm\\\bin\\\npm-cli.js"
	alias docker="/mnt/c/Program\ Files/Docker/Docker/resources/bin/docker.exe"
fi
