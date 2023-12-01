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
alias vim=nvim
alias ls='exa -al --group-directories-first --icons'
alias c=clear
alias cb="bash ~/dotfiles/script/bluetooth_connect.sh"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

setopt nobeep                                                   # No beep

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

tmux_sessionizer() {
  bash -c /home/yash/dotfiles/script/tmux_sessionizer.sh
  zle reset-prompt
}

tmux_session_switcher() {
  bash -c /home/yash/dotfiles/script/tmux_session_switcher.sh
  zle reset-prompt
}
zle -N tmux_sessionizer
zle -N tmux_session_switcher
bindkey '^f' tmux_sessionizer
bindkey '^s' tmux_session_switcher
