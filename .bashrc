export PS1="\u:\w $ "

export CLICOLOR=1
#export LSCOLORS=Exfxcxdxbxegedabagacad
#export LSCOLORS=ExFxCxDxBxegedabagacad
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export GREP_OPTIONS='--color=auto'

alias ll='ls -l'
alias la='ls -la'

# TMUX
#alias tm='~/.start_tmux.sh'
alias tma='tmux attach-session '
alias tmat='tmux attach-session -t '
alias tml='tmux list-sessions '
 
# Git related
alias gs='git status '
alias go='git checkout '

# Directory-related alias
alias Git='cd ~/Git'
alias Workspace='cd ~/Documents/workspace'
alias WebServer='cd /Library/WebServer'
