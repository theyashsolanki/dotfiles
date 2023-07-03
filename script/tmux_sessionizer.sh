#!/bin/bash

# Function to check if a TMUX session exists
session_exists() {
  tmux has-session -t="$1" 2>/dev/null
}

# Function to create a new TMUX session
create_session() {
  tmux new-session -d -s "$1" -c "$2"
}

# Function to switch to an existing TMUX session
switch_session() {
  tmux switch-client -t "$1"
}

# Check if an argument is provided
if [[ $# -eq 1 ]]; then
  selected="$1"
else
  selected=$(find ~ -type d | fzf --preview="exa -1a --group-directories-first {}")
fi

# Check if selection is empty
if [[ -z "$selected" ]]; then
  exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

# Check if inside a TMUX session
if [[ -z "$TMUX" ]]; then
  # Check if a session with the same name already exists
  if ! session_exists "$selected_name"; then
    create_session "$selected_name" "$selected"
  fi

  tmux attach-session -t "$selected_name"
else
  # Check if the current session is the same as the selected session
  current_session=$(tmux display-message -p '#S')
  if [[ "$current_session" != "$selected_name" ]]; then
    # Check if a session with the same name already exists
    if ! session_exists "$selected_name"; then
      create_session "$selected_name" "$selected"
    fi

    switch_session "$selected_name"
  fi
fi
