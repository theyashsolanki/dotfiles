
# dependencies


fzf 

ripgrep 

trash-cli 

unzip 

tmux 

exa 

zoxide 

starship 

npm

picom 

feh

sudo pacman -Sy $(pacman -Sgq nerd-fonts)

noto-fonts-emoji

zsh-syntax-highlighting 

zsh-autosuggestions 

zsh-history-substring-search 

mcfly







# /etc/X11/xorg.conf.d/30-touchpad.conf


Section "InputClass"
	Identifier "touchpad"
		Driver "libinput"
	MatchIsTouchpad "on"
	Option "tapping" "on"
	Option "AccelProfile" "adaptive"
	Option "TappingButtonMap" "Irm"
EndSection

