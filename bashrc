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
export PS1="\[\e[1m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\W]λ \[\e[0m\]"
