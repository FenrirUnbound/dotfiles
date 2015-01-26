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
  alias tma='tmux attach-session '
  alias tmat='tmux attach-session -t '
  alias tml='tmux list-sessions '
  alias tms='tmux new-session -d -s mandalore'
 

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

    case "$1" in
        simple)
            export PS1="\[\[\e[32;1m\]\h$EXTRAPROMPT \W> \[\e[0m\]"
            ;;
        2line)
            # Default PROMPT_COLOR values
            : ${PROMPT_COLOR:=Yellow}
            : ${PROMPT_COLOR2:=Blue}
            local C1=${!PROMPT_COLOR}
            local C2=${!PROMPT_COLOR2}

            # ┌(jer@myhost)─(✗)─(10:18 PM Sun Apr 14)
            # └─(~/dev/git/myproject)─>
            local DASH="\342\224\200"
            local X="\342\234\227"
            local BRANCH=$(git branch --no-color 2>/dev/null | sed -e "/^[^*]/d" -e "s/* //")
            local ALLCHANGED=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')

            local NEWLINE="\n"
            LINE1="${White}\342\224\214(${C1}\u@\h$EXTRAPROMPT${White})${ERRCODE}(${C1}\@ \d${White}) \$(old_status)"
            local LINE2="\342\224\224\342\224\200(${C2}\w${White})-> "
            export PS1="${NEWLINE}${LINE1}${NEWLINE}${LINE2}${Color_Off}"
            ;;
    esac
}


jslinter ()
{
    screwdriver lint;
    mkdir -p artifacts/jslint;
    file=$(cat artifacts/jslint/jslint.html |grep '<a' | perl -pe "s/^.*?<a[^>]*>(.*?)<\/a>.*?$/\1/g");
    for oi in ${file};
    do
        echo "=== ${file}";
        jslint -c $file -o artifacts/jslint;
    done
}

parse_git_branch() {
    if [ git ]; then
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    fi
}

old_status() {
    [ -d .git ] || git rev-parse --git-dir 2> /dev/null || return
    local BRANCH=$(git branch --no-color 2>/dev/null | sed -e "/^[^*]/d" -e "s/* //")
    local ALLCHANGED=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
    echo "[${BRANCH}:${ALLCHANGED}]"
}

export CLICOLOR=1
#export LSCOLORS=Exfxcxdxbxegedabagacad
#export LSCOLORS=ExFxCxDxBxegedabagacad
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

_manpage_color
_set_aliases
_set_history
_set_prompt 2line

[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh  # This loads NVM

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
source /Users/bobafett/.rvm/scripts/rvm

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
export PATH=/usr/local/bin:$PATH
