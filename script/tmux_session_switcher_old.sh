#!/bin/bash

tmux_session_switcher() {
  # Use fzf with preview to select a session
  selected_session=$(tmux ls | fzf --preview 'tmux list-windows -t {1} -F "#I:#W (#{session_width}x#{session_height}) - #{window_panes} panes - #{?window_active,active,}"')

  if [[ ! -n $selected_session ]]; then
    return
  fi

  # Switch to the selected session
  if [[ -z $TMUX ]] && [[ -n "$selected_session" ]]; then # If not in tmux
    tmux attach -t $(echo $selected_session | awk '{print $1}')
    return
  fi
  if [[ ! -z $TMUX ]] && [[ -n "$selected_session" ]]; then # If session is selected run tmux
    tmux switch-client -t "$(echo $selected_session | awk '{print $1}')"
  fi
}

export -f tmux_session_switcher 2>/dev/null
