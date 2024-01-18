# .bashrc

# if not running interactively, don't do anything
[[ $- != *i* ]] && return 

# Load aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Auto 'cd' when entering just a path
shopt -s autocd

# Enable vim keybinding for bash
set -o vi

# PS1
export PS1="\[\e[32m\]\u\[\e[m\]\[\e[37m\] \[\e[m\]\[\e[37m\]on\[\e[m\]\[\e[37m\] \[\e[m\]\[\e[33m\]\h\[\e[m\]\[\e[37m\] \[\e[m\]\[\e[37m\]at\[\e[m\]\[\e[37m\] \[\e[m\]\[\e[35m\]\w\[\e[m\]\[\e[37m\]\n\[\e[m\]\[\e[31m\]\\$\[\e[m\]\[\e[37m\]>\[\e[m\]\[\e[37m\] \[\e[m\]"
