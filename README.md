
# wifi

sudo systemctl start iwd

nmcli d wifi connect SSID password 'passprase'

# dependencies


sudo pacman -S fzf ripgrep trash-cli unzip tmux exa zoxide starship npm




sudo pacman -Sy $(pacman -Sgq nerd-fonts)


sudo pacman -S picom feh



sudo pacman -S noto-fonts-emoji



sudo pacman -S zsh-syntax-highlighting zsh-autosuggestions zsh-history-substring-search mcfly







/etc/X11/xorg.conf.d/30-touchpad.conf

Section "InputClass"
	Identifier "touchpad"
		Driver "libinput"
	MatchIsTouchpad "on"
	Option "tapping" "on"
	Option "AccelProfile" "adaptive"
	Option "TappingButtonMap" "Irm"
EndSection


# use timeshift at the end to backup
