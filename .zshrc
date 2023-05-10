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
        sudo
        aliases
        alias-finder
        colored-man-pages
        dircycle
        dirhistory
        dotenv
        genpass
        history
        fzf-zsh-plugin
        web-search
        command-not-found
        git-prompt
        git
        ubuntu
        ansible
        docker
        docker-compose
)

# Plugin Options
ZSH_ALIAS_FINDER_AUTOMATIC=true

# Load Aliases
if [ -f $HOME/.zsh_aliases ]; then
   source $HOME/.zsh_aliases
fi

source $ZSH/oh-my-zsh.sh
eval "$(zoxide init zsh)"
#eval "$(starship init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
