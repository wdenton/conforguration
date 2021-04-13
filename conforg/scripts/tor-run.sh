#!/bin/bash
if tmux has-session -t tor
 then
     echo "Session tor exists; killing it nicely ..."
     tmux send-keys -t tor:1 "C-c"
     tmux send-keys -t tor:2 "C-c"
     sleep 35
     tmux kill-window -t tor:1
     tmux kill-window -t tor:2
 fi

echo "Starting tor session ..."

tmux new-session -d -s "tor"

tmux new-window -t tor:2
tmux send-keys -t tor:2 "speedometer -t wlan0 -r wlan0 -l -m 1048576" "C-m"

tmux select-window -t 1
tmux send-keys -t tor:1 "tor" "C-m"
