

bind -x '"\C-f": bash ~/dotfiles/script/tmux_sessionizer.sh'
stty -ixon   ## disable C-s default behaveour
bind -x '"\C-s": bash ~/dotfiles/script/tmux_session_switcher.sh'
vimm() {
  if [ $# -eq 0 ]; then
    command nvim .
  else
    command nvim "$@"
  fi
}
alias vim=vimm
alias ls='exa -al --group-directories-first --icons'
alias c=clear
