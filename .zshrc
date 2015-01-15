# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="my"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=( \
    git \
    colored-man \
    pip \
    python \
    history-substring-search \
    autojump \
    dirpersist \
    zsh-syntax-highlighting \
    common-aliases \
    )

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# completion
zstyle ':completion:*' hosts off
bindkey -M menuselect '^M' .accept-line

# history settings
export HISTFILE=$HOME/.zhistory
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups

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

# python start file
export PYTHONSTARTUP=~/dotfiles/.pythonrc

include () { test -f "$1" && source "$1"; }

################################################################################
# MODULES
if include ~/local/lmod/lmod/init/zsh ; then
    module use ~/local/modules
    module use ~/flowsim/modules
    module use ~/flowsim/privatemodules

    # module load scons
    module load vim
    module load git
    module load ctags
    module load cscope
    module load ack
fi

################################################################################
# alias
alias grep='grep --color=auto'
alias l='ls -AFGh --color'
alias ll='ls -AFGlh --color'
alias kk='ll'
alias lt='ls -AFGlrth --color'
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

################################################################################
# local stuff
include ~/.myrc
