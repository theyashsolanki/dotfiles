# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
stty -ixon      ## remove default binding of '^s'
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Replace ls with exa
alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l.='exa -ald --color=always --group-directories-first --icons .*' # show only dotfiles
alias ip='ip -color'
alias c=clear
alias cb="bash ~/dotfiles/script/bluetooth_connect.sh"
alias big="expac -H M '%m\t%n' | sort -h | nl"     # Sort installed packages according to size in MB
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias grep='grep --color=auto'
alias rm='trash -v'
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
# vimm() {
#   if [ $# -eq 0 ]; then
#     command nvim .
#   else
#     command nvim "$@"
#   fi
# }
alias vim=nvim
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

setopt nobeep                                                   # No beep

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

tmux_sessionizer() {
  BUFFER="bash -c /home/yash/dotfiles/script/tmux_sessionizer.sh"
  zle accept-line
}

tmux_session_switcher() {
  BUFFER="bash -c /home/yash/dotfiles/script/tmux_session_switcher.sh"
  zle accept-line
}
zle -N tmux_sessionizer
zle -N tmux_session_switcher
bindkey '^f' tmux_sessionizer
bindkey '^s' tmux_session_switcher

HISTFILE=~/.zhistory
HISTSIZE=50000
SAVEHIST=10000

# # Load Mcfly
# export MCFLY_FUZZY=true
# export MCFLY_RESULTS=20
# export MCFLY_INTERFACE_VIEW=BOTTOM
# export MCFLY_RESULTS_SORT=LAST_RUN
# eval "$(mcfly init zsh)"
