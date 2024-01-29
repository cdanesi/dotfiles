#!/usr/bin/env bash

DMEDITOR="alacritty -e nvim"

declare -a options=(
   "alacritty - $HOME/.config/alacritty/alacritty.toml"
   "aliases - $HOME/.aliases"
   "ansible inventory - $HOME/projects/ansible/inventory.yml"
   "ansible playbooks - $HOME/projects/ansible/playbooks/"
   "archlinux-logout - $HOME/.config/archlinux-logout/archlinux-logout.conf"
   "bashrc - $HOME/.bashrc"
   "bat - $HOME/.config/bat/config"
   "btop - $HOME/.config/btop/btop.conf"
   "dotfiles readme - $HOME/.github/README.md"
   "dunst - $HOME/.config/dunst/dunstrc"
   "git - $HOME/.config/git/config"
   "htop - $HOME/.config/htop/htoprc"
   "i3 cheatsheet - $HOME/.config/i3/cheatsheet.md"
   "i3-autorun - $HOME/.config/i3/autorun.conf"
   "i3-keybinds - $HOME/.config/i3/keybinds.conf"
   "i3-restore - $HOME/.config/i3/i3-restore/config.json"
   "i3-theme - $HOME/.config/i3/theme.conf"
   "i3bar - $HOME/.config/i3/i3bar.conf"
   "i3config - $HOME/.config/i3/config"
   "i3config-$(hostname) - $HOME/.config/i3/$(hostname).conf"
   "i3status - $HOME/.config/i3status/config"
   "nano - $HOME/.config/nano/nanorc"
   "neofetch - $HOME/.config/neofetch/config.conf"
   "neovim init.lua - $HOME/.config/nvim/init.lua"
   "neovim keymap - $HOME/.config/nvim/lua/core/keymaps.lua"
   "neovim options - $HOME/.config/nvim/lua/core/options.lua"
   "neovim plugin config - $HOME/.config/nvim/lua/plugins/"
   "neovim plugins - $HOME/.config/nvim/lua/plugins.lua"
   "neovim theme - $HOME/.config/nvim/lua/core/colorscheme.lua"
   "p10k - $HOME/.p10k.zsh"
   "picom - $HOME/.config/picom/picom.conf"
   "ranger - $HOME/.config/ranger/rc.conf"
   "rofi - $HOME/.config/rofi/config.rasi"
   "rofi scripts - $HOME/.config/rofi/scripts"
   "ssh config - $HOME/.ssh/config"
   "tmux - $HOME/.config/tmux/tmux.conf"
   "todo.txt - $HOME/.config/todo/config"
   "zshrc - $HOME/.zshrc"
   "quit"
)

choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i 20 -p 'Edit config')

if [[ "$choice" == "quit" ]]; then
   echo "Exiting" && exit 1
elif [ "$choice" ]; then
   cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')
   $DMEDITOR "$cfg"
else
   echo "Exiting" && exit 1
fi
