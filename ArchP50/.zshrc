# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
autoload -Uz promptinit compinit predict-on
promptinit
compinit

(cat ~/.cache/wal/sequences &)

# Path to your oh-my-zsh installation.
export ZSH="/home/lugges/.oh-my-zsh"

ZSH_THEME="robbyrussell"

ENABLE_CORRECTION="true"
plugins=(git)

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
xset r rate 200 50
################################################################################
#                                                                              #
#                                   Aliases                                    #
#                                                                              #
################################################################################

alias ls='lsd'
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
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
alias lt='ls --tree'

alias la='ls -a'
alias l='ls -F'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias zat='zathura'
alias vrc='nvim ~/.config/nvim/init.vim'

alias brc='vim ~/.bashrc'
alias lsde='lsblk | grep -v loop'

alias vic='vim ~/.config/i3/config'
alias dd='dd status=progess'

alias fd="sudo find -name "
alias fr="sudo find / -name"

alias kez='setxkbmap de; xset r rate 200 50'
alias ipy='ipython'

alias dspw='cat ~/CTS6/Datascience/pw.txt | xclip'

################################################################################
#                       pacman aliases                                         #
#                                                                              #
################################################################################
alias pi='sudo pacman -S'
alias pls='sudo pacman -Qs'

alias psrc='sudo pacman -Ss'
alias upd='sudo pacman -Syy; sudo pacman -Syu;'

alias vz='nvim ~/.zshrc'
alias vim='nvim'

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

prm(){ 
    sudo pacman -Rs $1
    sudo paccache -r 
}

chdips(){
    if [[ $1 == top ]]
    then
        xrandr --output HDMI-2 --above eDP-1
    elif [[ $1 == bottom ]]
    then 
        xrandr --output HDMI-2 --below eDP-1
    elif [[ $1 == right ]]
    then
        xrandr --output HDMI-2 --right-of eDP-1
    elif [[ $1 == left ]]
    then 
        xrandr --output HDMI-2 --left-of eDP-1
    elif [[ $1 == mirror ]]
    then
        xrandr --output HDMI-2 --same-as eDP-1
    fi
}
#cuda
export PATH="$(du $HOME/.scripts/ | cut -f2 | tr '\n' ':')$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
xmodmap -e "keycode 66 = ISO_Level3_Shift"
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
