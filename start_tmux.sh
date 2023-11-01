#!/bin/sh

session="work"
tmux start-server
tmux new-session -d -s $session

tmux splitw -h
tmux selectp -t 2
tmux send-keys "nvim boglog.txt" C-m

tmux new-window -t $session:2
tmux send-keys "avn-toolbox-shell 38" C-m
tmux send-keys "cd ~/aiven/aiven-core" C-m
tmux send-keys "nvim ." C-m

tmux new-window -t $session:3
tmux send-keys "avn-toolbox-shell 38" C-m
tmux send-keys "cd ~/aiven/aiven-core" C-m
tmux send-keys "source <(python3 -m aiven.admin dev env)" C-m
tmux send-keys "source <(python3 -m aiven.admin dev zsh-completion)" C-m
tmux splitw -h
tmux send-keys "avn-toolbox-shell 38" C-m
tmux send-keys "cd ~/aiven/aiven-core" C-m
tmux send-keys "source <(python3 -m aiven.admin dev env)" C-m
tmux send-keys "source <(python3 -m aiven.admin dev zsh-completion)" C-m
tmux splitw -v
tmux send-keys "avn-toolbox-shell 38" C-m
tmux send-keys "cd ~/aiven/aiven-core" C-m
tmux send-keys "source <(python3 -m aiven.admin dev env)" C-m
tmux send-keys "source <(python3 -m aiven.admin dev zsh-completion)" C-m
tmux selectp -t 1
tmux splitw -v
tmux send-keys "avn-toolbox-shell 38" C-m
tmux send-keys "cd ~/aiven/aiven-core" C-m
tmux send-keys "source <(python3 -m aiven.admin dev env)" C-m
tmux send-keys "source <(python3 -m aiven.admin dev zsh-completion)" C-m

tmux attach-session -t $session
