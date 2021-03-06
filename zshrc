#
# Auto-completion
#

autoload -U compinit
compinit -u

# Make completions:
#  - case insensitive
#  - accepting of abbreviations after ., _ or - (ie f.b -> foo.bar)
#  - substring matching (ie. bar -> foobar)
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Colorize completions using default "ls" colors
zstyle ':completion:*' list-colors ''

#
# Prompt
#

autoload -U colors
colors

# VCS information
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "%F{green}●%f" # default 'S'
zstyle ':vcs_info:*' unstagedstr "%F{red}●%f" # default 'U'
zstyle ':vcs_info:*' use-simple true
zstyle ':vcs_info:git+set-message:*' hooks git-untracked
zstyle ':vcs_info:git*:*' formats '[%b%m%c%u] ' # default ' (%s)-[%b]%c%u-'
zstyle ':vcs_info:git*:*' actionformats '[%b|%a%m%c%u] ' # default ' (%s)-[%b|%a]%c%u-'

function +vi-git-untracked() {
  emulate -L zsh
  if [[ -n $(git ls-files --exclude-standard --others 2> /dev/null) ]]; then
    hook_com[unstaged]+="%F{blue}●%f"
  fi
}

RPROMPT_BASE="\${vcs_info_msg_0_}%F{blue}%~%f"
setopt PROMPT_SUBST

export RPROMPT=$RPROMPT_BASE
export PS1="%F{green}${SSH_TTY:+%n@%m}%f%B${SSH_TTY:+:}%b%F{blue}%1~%F{yellow}%B%(1j.*.)%(?..!)%b%f%F{red}%B%b%f "

#
# Options
#

# .. is shortcut for cd ..
setopt autocd

# tab-completing a directory appends a slash at the end
setopt autoparamslash

# command- and argument-auto-correction
setopt correct
setopt correctall

# print exit value for non-zero exit codes
setopt printexitvalue

# share history across shells
setopt sharehistory

#
# History
#

export HISTSIZE=100000
export HISTFILE="$HOME/.zhistory"
export SAVEHIST=$HISTSIZE

#
# External settings
#

source $HOME/.zsh/aliases
source $HOME/.zsh/colors
source $HOME/.zsh/completions
source $HOME/.zsh/exports
test -e $HOME/.zshrc.local && source $HOME/.zshrc.local

#
# Hooks
#

autoload -U add-zsh-hook

# Set title of tab and window to be the current working directory
function set-tab-and-window-title() {
  emulate -L zsh
  print -Pn "\e]0;%n@%m: %~\a"
}
add-zsh-hook precmd set-tab-and-window-title

# Add VCS info to prompt
add-zsh-hook precmd vcs_info

# Record the start time of processes being started
typeset -F SECONDS
function record-start-time() {
  emulate -L zsh
  ZSH_START_TIME=${ZSH_START_TIME:-$SECONDS}
}
add-zsh-hook preexec record-start-time

# Report start time of processes after they terminate
function report-start-time() {
  emulate -L zsh
  if [ $ZSH_START_TIME ]; then
    local DELTA=$(($SECONDS - $ZSH_START_TIME))
    local DAYS=$((~~($DELTA / 86400)))
    local HOURS=$((~~(($DELTA - $DAYS * 86400) / 3600)))
    local MINUTES=$((~~(($DELTA - $DAYS * 86400 - $HOURS * 3600) / 60)))
    local SECS=$(($DELTA - $DAYS * 86400 - $HOURS * 3600 - $MINUTES * 60))
    local ELAPSED=''
    test "$DAYS" != '0' && ELAPSED="${DAYS}d"
    test "$HOURS" != '0' && ELAPSED="${ELAPSED}${HOURS}h"
    test "$MINUTES" != '0' && ELAPSED="${ELAPSED}${MINUTES}m"
    if [ "$ELAPSED" = '' ]; then
      SECS="$(print -f "%.2f" $SECS)s"
    elif [ "$DAYS" != '0' ]; then
      SECS=''
    else
      SECS="$((~~$SECS))s"
    fi
    ELAPSED="${ELAPSED}${SECS}"
    local ITALIC_ON=$'\e[3m'
    local ITALIC_OFF=$'\e[23m'
    export RPROMPT="%F{cyan}%{$ITALIC_ON%}${ELAPSED}%{$ITALIC_OFF%}%f $RPROMPT_BASE"
    unset ZSH_START_TIME
  else
    export RPROMPT="$RPROMPT_BASE"
  fi
}
add-zsh-hook precmd report-start-time
