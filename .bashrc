# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# [ -f $HOME/local/zsh/5.0.2/bin/zsh ] && {
#     echo "Type y to run zsh: \c"
#     read line
#     [ "$line" = y ] && exec $HOME/local/zsh/5.0.2/bin/zsh
# }
. ~/dotfiles/.mybashrc
