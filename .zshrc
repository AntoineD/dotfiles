include () { test -f "$1" && source "$1"; }

include ~/.proxy

################################################################################
# antigen
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
source <(glab completion -s zsh); compdef _glab glab

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

export VISUAL=nvim
export EDITOR="$VISUAL"

# use nvim for reading manpages
export MANPAGER="nvim +Man!"

# python start file
export PYTHONSTARTUP=~/dotfiles/.pythonrc

# encoding
export LANG=en_US.UTF-8
export LC_ALL=$LANG
export LANGUAGE=$LANG

export PATH=~/.local/bin:$PATH

################################################################################
# alias
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
alias m="less"
alias v="vim"
alias n="nvim"
alias c="cd"
alias ca="conda activate"
alias cda="conda deactivate"
alias b="bat"
alias t="tox -e"
alias mm="micromamba"

# for using fd
unalias fd

################################################################################
# dircolors
eval `dircolors $HOME/dotfiles/dircolors-solarized/dircolors.ansi-universal`

################################################################################
# FZF
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_DEFAULT_OPTS="--preview"

################################################################################
# starship
export STARSHIP_CONFIG=~/dotfiles/starship.toml
eval "$(starship init zsh)"

################################################################################
# local stuff
include ~/.myrc
