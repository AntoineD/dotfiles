source ~/.proxy
source $HOME/dotfiles/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle colored-man-pages
antigen bundle pip
antigen bundle python
# antigen bundle history-substring-search
antigen bundle autojump
antigen bundle dirpersist
antigen bundle common-aliases

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle ericfreese/zsh-cwd-history needs md5

antigen theme $HOME/dotfiles/.oh-my-zsh/custom/themes my.zsh-theme

antigen apply

################################################################################
# history settings

# Bind terminal-specific up and down keys
# Bind in both emacs and vi modes so it works in both, and is not
# sensitive to whether this is loaded before or after the vi-mode plugin
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

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

################################################################################
# dircolors
eval `dircolors $HOME/dotfiles/dircolors-solarized/dircolors.ansi-universal`

################################################################################
# local stuff
include ~/.myrc
