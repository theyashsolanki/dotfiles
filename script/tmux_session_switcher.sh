#!/bin/bash

# Use fzf with customized preview to select a session
selected_session=$(tmux list-sessions -F "#{?session_attached,#{session_name} (attached),#{session_name}}" | fzf --preview 'tmux list-windows -t {1} -F "#I: #W - #{window_panes} pane (#{?window_active,active,})"' --preview-window 'up:40%:wrap')

# Check if a session was selected
if [[ -z $selected_session ]]; then
  exit 0
fi

# Switch to the selected session
if [[ -z $TMUX ]]; then # If not in tmux, attach to the selected session
  tmux attach -t "$(echo "$selected_session" | awk '{print $1}')"
else # If already in tmux, switch to the selected session
  tmux switch-client -t "$(echo "$selected_session" | awk '{print $1}')"
fi
