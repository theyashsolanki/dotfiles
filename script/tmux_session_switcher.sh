#!/bin/bash


# Use fzf with preview to select a session
selected_session=$(tmux ls | fzf --preview 'tmux list-windows -t {1} -F "#I:#W (#{session_width}x#{session_height}) - #{window_panes} panes - #{?window_active,active,}"')

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
