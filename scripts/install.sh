#!/usr/bin/bash

: '
   Run this script to install dependencies when setting up a new environment.

   I will work on making this a bit more sane - later.
'

function init() {
   isAvailable zsh
   isAvailable tmux
   isAvailable nvim
   isAvailable git

   # Oh-My-ZSH
   if [[ -f $HOME/.oh-my-zsh/oh-my-zsh.sh ]]; then
      echo "oh-my-zsh already installed, continuing..."
   else
      if [[ $(isAvailable curl) ]]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
     elif [[ $(isAvailable wget) ]]; then
        sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
     else
        echo "you need to have either curl or wget installed. aborting"
        return -1
     fi
   fi
}

function install_plugins() {
   # tmux plugin manager
   if [[ -d $HOME/.config/tmux/plugins/tpm ]]; then
      echo "updating tmux plugin manager"
   fi
   git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm &> /dev/null

   # zsh-autosuggestions
   if [[ -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]]; then
      echo "updating zsh-autosuggestions"
   fi
   git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &> /dev/null

   # zsh-syntax-highlighting
   if [[ -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]]; then
      echo "updating zsh-syntax-highlighting"
   fi
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &> /dev/null

   # fzf-zsh-plugin
   if [[ -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin ]]; then
      echo "updating fzf-zsh-plugin"
   fi
   git clone --depth 1 https://github.com/unixorn/fzf-zsh-plugin.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin &> /dev/null

   # zsh-vi-mode
   if [[ -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-vi-mode ]]; then
      echo "updating zsh-vi-mode"
   fi
   git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-vi-mode &> /dev/null
}

function install_themes() {
   #powerlevel10k zsh theme
   if [[ -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]]; then
      echo "updating powerlevel10k zsh theme"
   fi
   git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k &> /dev/null
}

function isAvailable() {
   if [[ ! $(which $1) ]]; then
      echo "please install $1 and run $0 again. aborting"
      exit
   fi
}

init
install_themes
install_plugins
