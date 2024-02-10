# .bashrc

# if not running interactively, don't do anything
[[ $- != *i* ]] && return 

# Load aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.git-prompt.sh ]; then
    . ~/.git-prompt.sh
fi

# Auto 'cd' when entering just a path
shopt -s autocd

# Enable vim keybinding for bash
set -o vi

# PS1
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='[\[\e[38;5;81m\]\W\[\e[0m\]]\[\e[38;5;50m\]${PS1_CMD1}\[\e[0m\] \[\e[38;5;228;1m\]\$\[\e[0m\] '
