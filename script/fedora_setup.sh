#!/bin/bash

sudo dnf install -y git vim neovim zsh tmux fzf unzip go nodejs kitty tldr python-devel g++ brightnessctl pavucontrol picom dunst polybar rofi eza bat feh polkit-gnome xclip akmod-nvidia xorg-x11-drv-nvidia-cuda 

sudo dnf config-manager --set-enabled fedora-cisco-openh264

sudo dnf install gstreamer1-plugin-openh264 mozilla-openh264

