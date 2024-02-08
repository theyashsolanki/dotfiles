#!/bin/bash

sudo dnf copr enable atim/lazygit -y
sudo dnf install -y i3 git vim neovim zsh tmux fzf unzip go nodejs kitty trash-cli tldr lazygit python-devel g++ brightnessctl pavucontrol picom dunst polybar rofi eza bat feh polkit-gnome xclip akmod-nvidia xorg-x11-drv-nvidia-cuda 

sudo dnf config-manager --set-enabled fedora-cisco-openh264

sudo dnf install gstreamer1-plugin-openh264 mozilla-openh264

flatpak install com.discordapp.Discord

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.zsh/zsh-history-substring-search

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k

git clone --depth=1 https://github.com/adi1090x/rofi.git ~/rofithemes
chmod +x ~/rofithemes/setup.sh
bash ~/rofithemes/setup.sh
rm -rf ~/rofithemes

cp ../.zshrc ~/.zshrc
sudo cp ../30-touchpad.conf /etc/X11/xorg.conf.d
cp -r ~/dotfiles/.config/tmux ~/.config/
cp -r ~/dotfiles/.config/i3 ~/.config/
cp -r ~/dotfiles/.config/kitty ~/.config/
cp -r ~/dotfiles/.config/polybar ~/.config/
cp -r ~/dotfiles/.config/dunst ~/.config/
cp -r ~/dotfiles/.config/picom ~/.config/
