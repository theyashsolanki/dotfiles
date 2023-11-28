#!/bin/bash

# Function to check if a TMUX session exists
session_exists() {
  tmux has-session -t="$1" 2>/dev/null
}

# Function to create a new TMUX session or switch to an existing one
tmux_sessionizer() {

  if [[ $# -eq 1 ]]; then
    selected="$1"
  else
    selected=$(find ~/personal ~/.config ~/Downloads -type d | fzf --preview="exa -1a --group-directories-first {}")
  fi

  if [[ -z "$selected" ]]; then
    echo "No directory selected. Exiting."
    return
  fi

  selected_name=$(basename "$selected" | tr . _)

  if [[ -z "$TMUX" ]]; then
    if ! session_exists "$selected_name"; then
      BUFFER="tmux new-session -d -s $selected_name -c $selected"
    fi

    BUFFER="tmux attach-session -t $selected_name"
    zle accept-line
  else
    current_session=$(tmux display-message -p '#S')
    if [[ "$current_session" != "$selected_name" ]]; then
      if ! session_exists "$selected_name"; then
        BUFFER="tmux switch-client -t $selected_name -c $selected"
        zle accept-line
      fi

      BUFFER="tmux switch-client -t $selected_name"
      zle accept-line
    fi
  fi
}

export -f tmux_sessionizer 2>/dev/null
