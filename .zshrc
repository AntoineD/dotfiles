source ~/.proxy

# export ANTIGEN_CACHE=false
source $HOME/dotfiles/antigen.zsh
antigen init $HOME/dotfiles/.antigenrc

################################################################################
# history settings

# Bind terminal-specific up and down keys
# Bind in both emacs and vi modes so it works in both, and is not
# sensitive to whether this is loaded before or after the vi-mode plugin
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey -M emacs '^F' vi-forward-blank-word
bindkey -M emacs '^B' vi-backward-blank-word

if [[ -n "$terminfo[kcuu1]" ]]; then
    bindkey -M emacs "$terminfo[kcuu1]" history-substring-search-up
    bindkey -M viins "$terminfo[kcuu1]" history-substring-search-up
fi
if [[ -n "$terminfo[kcud1]" ]]; then
    bindkey -M emacs "$terminfo[kcud1]" history-substring-search-down
    bindkey -M viins "$terminfo[kcud1]" history-substring-search-down
fi

export HISTFILE=$HOME/.zhistory
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups

###############################################################################
# completion
zstyle ':completion:*' hosts off
bindkey -M menuselect '^M' .accept-line

################################################################################
# autosuggestions
bindkey '^\j' autosuggest-execute
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='bg=red,fg=white'

################################################################################
# disable ctrl-s that freezes the shell
if [ -t 0 ]; then
    stty ixany
    stty ixoff -ixon
fi

# default file permissions
umask u=rwx,g=rx,o=rx

export PAGER=less
# export LESS='-MN'

# use nvim for reading manpages
export MANPAGER="nvim -c 'set ft=man' -"

# python start file
export PYTHONSTARTUP=~/dotfiles/.pythonrc

# encoding
export LANG=en_US.UTF-8
export LC_ALL=$LANG
export LANGUAGE=$LANG

include () { test -f "$1" && source "$1"; }

################################################################################
# alias
alias grep='grep --color=auto'
alias ll='ls -AFGh --color'
alias lt='ls -AFGlrth --color'
alias l='ls -AFGlh --color'
alias kk='ll'
alias h='history'
alias j="jobs -l"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias dir='ls -ba'
alias ss="ps -aux"
alias dot='ls .[a-zA-Z0-9_]*'
alias m="less"
alias v="vim"
alias n="nvim"
alias c="cd"

# for using fd
unalias fd

################################################################################
# dircolors
eval `dircolors $HOME/dotfiles/dircolors-solarized/dircolors.ansi-universal`

################################################################################
# local stuff
include ~/.myrc

################################################################################
# FZF
# export FZF_DEFAULT_OPTS="--preview"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
