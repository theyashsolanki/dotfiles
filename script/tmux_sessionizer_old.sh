#!/bin/bash
tmux_sessionizer() {
  if [[ $# -eq 1 ]]; then
    selected=$1
  else
    selected=$(find ~ -type d | fzf --preview="exa -al {}")
  fi

  if [[ -z $selected ]]; then
    return
  fi

  selected_name=$(basename "$selected" | tr . _)
  tmux_running=$(pgrep tmux)

  if [[ -z $TMUX ]] ; then
    BUFFER="tmux new -s $selected_name -c $selected"
    zle accept-line
  else
    if ! tmux has-session -t=$selected_name 2> /dev/null; then
      tmux new-session -ds $selected_name -c $selected
    fi

    tmux switch-client -t $selected_name
  fi
}

export -f tmux_sessionizer 2>/dev/null
