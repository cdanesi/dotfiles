# ~/.bash_aliases

# enable color 
if [ -x /usr/bin/dircolors ]; then
   test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

   #alias ls='ls -h --color=auto'
   alias ls='exa -h'
   alias grep='grep --color=auto'
   alias fgrep='fgrep --color=auto'
   alias egrep='egrep --color=auto'
   alias less='less --use-color'
   alias diff='diff --color'
   alias hexedit='hexedit --color'
   alias ip='ip --color'
fi

# ls aliases
alias ll='ls -alFh'
alias la='ls -Ah'
alias l='ls -CFh'
alias lsa='ls -alh'

# handy system cmds 
alias cp='nocorrect cp -i'
alias md='mkdir -p'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv -i'
alias rd=rmdir
alias rm='rm -i'

# command replacements
alias cat='bat --paging=never --style=plain'

# todo.txt
alias t='/usr/bin/todo.sh -a'

# APT shortcuts
alias age='sudo apt'
alias agi='sudo apt install'
alias agr='sudo apt remove'
alias agu='sudo apt update'
alias agud='sudo apt update && sudo apt dist-upgrade'
alias agug='sudo apt upgrade'
alias aguu='sudo apt update && sudo apt upgrade'

# nocorrect
alias man='nocorrect man'
alias su='nocorrect su'
alias sudo='nocorrect sudo'

# fzf
alias fkill=fzf-kill
