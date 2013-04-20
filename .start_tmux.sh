#!/bin/sh

tmux new-session -d -s mandalore

#tmux new-window -t mandalore:1 -n 'VM0' 'ssh vm0'
#tmux new-window -t mandalore:2 -n 'VM1' 'ssh vm1'

tmux split-window -v -t mandalore:0 -p 75

tmux select-window -t mandalore:0
tmux -2 attach-session -t mandalore
