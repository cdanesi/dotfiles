# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$PATH:~/bin:~/.local/bin
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'
export GPG_TTY=$(tty)
#export ZVM_INIT_MODE='sourcing'

ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME_RANDOM_CANDIDATES=( "cypher" "eastwood" "gallois" )
# DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=100000

plugins=(
        zsh-autosuggestions
        zsh-syntax-highlighting
        last-working-dir
        zsh-vi-mode
        fzf-zsh-plugin
        sudo
        aliases
        alias-finder
        colored-man-pages
        dircycle
        dirhistory
        zoxide
        dotenv
        genpass
        history
        web-search
        command-not-found
        git-prompt
)

# Fix ctrl+r 
source $HOME/.oh-my-zsh/custom/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')

# Plugin Options
ZSH_ALIAS_FINDER_AUTOMATIC=true

source $ZSH/oh-my-zsh.sh
#eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

function zvm_after_init() {
  autoload add-zle-hook-widget
  add-zle-hook-widget zle-line-pre-redraw zvm_zle-line-pre-redraw
}

# Load aliases
if [ -f $HOME/.aliases ]; then
   source $HOME/.aliases
fi

if [ -f /usr/bin/pfetch ]; then
   /usr/bin/pfetch
fi
