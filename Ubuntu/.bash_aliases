###############################################################################
#                                                                             #
#                                   Aliases                                   #
#                                                                             #
###############################################################################

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias zat='zathura'
alias vrc='vim ~/.vimrc'

alias brc='vim ~/.bashrc'
alias lsd='lsblk | grep -v loop'

alias dd='dd status=progess'
################################################################################
#                       custom functions                                       #
#                                                                              #
################################################################################
# function to change the background

chwal(){
    if [[ $1 != *.png ]]
    then
        convert $1 /tmp/wall.png
        mv /tmp/wall.png ~/.config/wall.png
    else
        cp $1 ~/.config/wall.png
    fi

    wal -i ~/.config/wall.png 
    feh --bg-scale ~/.config/wall.png
}



