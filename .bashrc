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

_set_prompt() {
    # Reset
    local Color_Off='\[\e[0m\]'       # Text Reset

    # Regular Colors
    local Black='\[\e[0;30m\]'        # Black
    local Red='\[\e[0;31m\]'          # Red
    local Green='\[\e[0;32m\]'        # Green
    local Yellow='\[\e[0;33m\]'       # Yellow
    local Blue='\[\e[0;34m\]'         # Blue
    local Purple='\[\e[0;35m\]'       # Purple
    local Cyan='\[\e[0;36m\]'         # Cyan
    local White='\[\e[0;37m\]'        # White

    : ${PROMPT_COLOR:=Yellow}
    : ${PROMPT_COLOR2:=Blue}
    local C1=${!PROMPT_COLOR}
    local C2=${!PROMPT_COLOR2}

    local NEWLINE="\n"
    local LINE1="\342\224\214${White}(${Cyan}\w${White})"
    local LINE2="\342\224\224\342\224\200(${Blue}\u${Purple}@${Blue}\h${White})-> "
    export PS1="${NEWLINE}${LINE1} \$(git_branch)${NEWLINE}${LINE2}"
}

git_branch() {
    [ -d .git ] || git rev-parse --git-dir 2> /dev/null || return
    local BRANCH=$(git branch --no-color 2>/dev/null | sed -e "/^[^*]/d" -e "s/* //")
    local ALLCHANGED=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
    echo "[${BRANCH}:${ALLCHANGED}]"
}


#export PS1="\u:\w $ "

export CLICOLOR=1
#export LSCOLORS=Exfxcxdxbxegedabagacad
#export LSCOLORS=ExFxCxDxBxegedabagacad
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

_manpage_color
_set_aliases
_set_history
_set_prompt
