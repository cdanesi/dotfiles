# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'
export GPG_TTY=$(tty)

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
export ZSH_ALIAS_FINDER_AUTOMATIC=true

ZSH_THEME="powerlevel10k/powerlevel10k"
# DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=128000
SAVEHIST=128000

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'

zvm_after_init_commands+=(init_env)

function zvm_config() {
   export ZVM_INIT_MODE='sourcing'
   export ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
   export ZVM_VI_EDITOR="$VISUAL"
   export ZVM_VI_SURROUND_BINDKEY='classic'
   export ZVM_VI_INSERT_ESCAPE_BINDKEY='jk'
   export ZVM_ESCAPE_KEYTIMEOUT=0.03
}

plugins=(
   alias-finder
   aliases
   ansible
   battery
   colored-man-pages
   command-not-found
   dircycle
   dirhistory
   docker
   docker-compose
   dotenv
   genpass
   git
   git-prompt
   history
   last-working-dir
   ssh
   ssh-agent
   sudo
   tmux
   vscode
   web-search
   zsh-autosuggestions
   zsh-syntax-highlighting
)

# set up dircolors
case $(uname -s) in

   Darwin)
      plugins+=(
         brew
         copypath
         macos
      )

      [[ ! -f $(which gdircolors) ]] || $(test -f "$HOME"/.dircolors && eval $(gdircolors "$HOME"/.dircolors) || eval $(gdircolors))
      ;;

   Linux)
      plugins+=(
         archlinux
         ubuntu
      )

      test -f "$HOME"/.dircolors && eval $(dircolors -b "$HOME"/.dircolors) || eval $(dircolors -b)
      ;;

   *) ;;
esac

function init_env() {
   eval "$(zoxide init zsh)"
   eval "$(fzf --zsh)"
   
   # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
   [[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh
   
   # Load aliases
   [[ ! -f $HOME/.aliases ]] || source $HOME/.aliases
   
   # display mini system info
   [[ ! -f $(which pfetch) ]] || $(which pfetch)
}

[[ ! -f $ZSH/oh-my-zsh.sh ]] || source $ZSH/oh-my-zsh.sh

function zvm_after_init() {
   autoload add-zle-hook-widget
   add-zle-hook-widget zle-line-pre-redraw zvm_zle-line-pre-redraw
}

_fzf_compgen_path() {
   fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
   fd --type=d --hidden --exclude .git . "$1"
}

_fzf_comprun() {
   local command=$1
   shift

   case "$command" in
      cd)
         fzf --preview 'eza --tree --color=always {} | head -200' "$@"
         ;;
      export|unset)
         fzf --preview "eval 'echo \$' {}" "$@"
         ;;
      ssh)
         fzf --preview 'dig {}' "$@"
         ;;
      *)
         fzf --preview "--preview 'bat -n --color=always --line-range :500'" "$@"
         ;;
   esac
}

[[ ! -f $ZSH/custom/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh ]] || source "$ZSH"/custom/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
