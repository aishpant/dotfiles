#
# ~/.bashrc
#

# If not running interactively, don't do anything
# [[ $- != *i* ]] && return

# alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '

export VISUAL="nvim"
export EDITOR="nvim"

export PATH=/usr/local/bin:$PATH
. /Users/aishwarya/.rbenvrc
. ~/.stripe-repos.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
