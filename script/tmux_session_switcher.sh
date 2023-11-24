#!/bin/bash

# Use fzf with customized preview to select a session
selected_session=$(
  tmux list-sessions -F "#{?session_attached,#{session_name} (attached),#{session_name} }" |
    awk '{print $NF, $0}' |              # Add last visited time as a prefix
    sort -n |                           # Sort by last visited time numerically
    cut -d ' ' -f 2- |                   # Remove the first column (last visited time)
    fzf
)

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
