_set_history() {
  export HISTFILE=~/.bash_history
  export HISTSIZE=10000
  export HISTFILESIZE=${HISTSIZE}
  export HISTCONTROL=ignoredups:ignorespace
  # Append instead of overwrite history
  shopt -s histappend

  # Do *not* append the following to our history:
  HISTIGNORE='\&:fg:bg:ls:pwd:cd ..:cd ~-:cd -:cd:jobs:set -x:ls -l:ls -l'
  HISTIGNORE=${HISTIGNORE}':%1:%2:popd:top:shutdown*'
  export HISTIGNORE
}

_manpage_color() {
  export LESS_TERMCAP_mb=$'\E[01;31m'
  export LESS_TERMCAP_md=$'\E[01;31m'
  export LESS_TERMCAP_me=$'\E[0m'
  export LESS_TERMCAP_se=$'\E[0m'
  export LESS_TERMCAP_so=$'\E[01;44;33m'
  export LESS_TERMCAP_ue=$'\E[0m'
  export LESS_TERMCAP_us=$'\E[01;32m'
}

_set_aliases() {
  alias ll='ls -l'
  alias la='ls -la'

  alias grep="grep --color=auto"

  # Git related
  alias gs='git status '
  alias go='git checkout '

  # TMUX
  #alias tm='~/.start_tmux.sh'
  alias tma='tmux attach-session '
  alias tmat='tmux attach-session -t '
  alias tml='tmux list-sessions '
 

  # Directory-related alias
  alias Git='cd ~/Git'
  alias Workspace='cd ~/Documents/workspace'
  alias WebServer='cd /Library/WebServer'
}

export PS1="\u:\w $ "

export CLICOLOR=1
#export LSCOLORS=Exfxcxdxbxegedabagacad
#export LSCOLORS=ExFxCxDxBxegedabagacad
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

_manpage_color
_set_aliases
_set_history
