#!/bin/sh

# SESSION_NAME=$1
# PROJECT_DIRECTORY=$2

if tmux has-session -t "$1" 2>/dev/null; then
  tmux attach-session -t "$1"
else
  cd "$2" && \
    tmux new-session -d -s "$1" \; \
    send-keys "lazygit" C-m \; \
    new-window \; \
    send-keys "hx" C-m \; \
    new-window \; \
    attach-session -t "$1"
fi
