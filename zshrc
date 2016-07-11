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

c() { cd ~/Code/$1; }
_c() { _files -W ~/Code -/; }
compdef _c c

# Set by some git stuff
unalias gc

gc() { cd ~/go-code/src/github.com/$1; }
_gc() { _files -W ~/go-code/src/github.com -/; }
compdef _gc gc
