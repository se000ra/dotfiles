# ~/.bashrc: executed by bash(1) for non-login shells.
#to source bashrc  '. .bashrc'
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000
HISTTIMEFORMAT="%F %T %t"
#write (-a) and then re-read (-n) the history each time 
PROMPT_COMMAND="history -a; history -n"

# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
#красим промт
prompt_command () {
    local GREEN="\[\033[0;32m\]"
    local CYAN="\[\033[0;36m\]"
    local BCYAN="\[\033[1;36m\]"
    local BLUE="\[\033[0;34m\]"
    local GRAY="\[\033[0;37m\]"
    local DKGRAY="\[\033[1;30m\]"
    local WHITE="\[\033[1;37m\]"
    local RED="\[\033[0;31m\]"
    local DEFAULT="\[\033[0;39m\]"

    # set an error string for the prompt, if applicable
    if [ $? -eq 0 ]; then
        ERRPROMPT=""
    else
        ERRPROMPT="($?)"
    fi
    #красим git
    local GP=""
    local GIT_STATUS=$(git status 2> /dev/null) 
    if [ -n "GIT_STATUS" ]
    then 
        GP=$GP$(git branch --no-color 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/\1/")

        echo $GIT_STATUS | grep modified: > /dev/null 2>&1
        if [ "$?" -eq "0" ]
        then GP=$GP"*"
        fi

        echo $GIT_STATUS | grep deleted: > /dev/null 2>&1
        if [ "$?" -eq "0" ]
        then GP=$GP"-"
        fi

        echo $GIT_STATUS | grep "Untracked files:" > /dev/null 2>&1
        if [ "$?" -eq "0" ]
        then GP=$GP"+"
        fi

        echo $GIT_STATUS | grep "Unmerged paths" > /dev/null 2>&1
        if [ "$?" -eq "0" ]
        then GP=$GP"|m|"
        fi
    fi
    #local LOAD=`cut -d' ' -f1 /proc/loadavg`
    #local TIME=`date +"%d.%m.%Y %H:%M:%S"`
    local TIME=`date +"%H:%M"`
    local CURENT_PATH=`echo ${PWD/#$HOME/\~}`
 
    # trim long path
    if [ ${#CURENT_PATH} -gt "35" ]; then
        let CUT=${#CURENT_PATH}-35
        CURENT_PATH="…$(echo -n $PWD | sed -e "s/\(^.\{$CUT\}\)\(.*\)/\2/")"
    fi
 
    #local BC="╚("#₪₪├i┐└┴┬├─╟┼─╼卐→│└──>─■_╼ )─╼╰ _╭echo "⮀ ± ⭠ ➦ ✔ ✘ ⚡"(
    #local BC="╚═"╞╟╚╔╩╦╠═ ╬⇐ ╬⇒ …»»☭   ╾──╼>      ╰▬═►
    local TC="╭"
    local BC="╰╼ "

    PROMPT="${TIME} ${GP} $ERRPROMPT ${CURENT_PATH}"
    local SEPARATOR=""
    let FILLS=${COLUMNS}-${#PROMPT}+0-2
    for (( i=0; i<$FILLS; i++ )) do
        SEPARATOR=$SEPARATOR"─"
    done

    TOP_LINE="${DKGRAY}${TC}(${CYAN}${TIME}${DKGRAY})${RED}$ERRPROMPT${GREEN}${GP} ${GRAY}${CURENT_PATH} ${DKGRAY}${SEPARATOR}"
    local BOTTOM_LINE="${DKGRAY}${BC} ${DEFAULT}"
    export PS1="${TOP_LINE}\n${BOTTOM_LINE}"
}
PROMPT_COMMAND=prompt_command

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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias edbash='vim ~/dotfiles/bashrc'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
# настройка цветов для tmux
[ -z "$TMUX" ] && export TERM=xterm-256color
export EDITOR=vim

PATH=$PATH:$HOME/src/android-sdk-linux/tools # Androd sdk
PATH=$PATH:$HOME/src/android-sdk-linux/platform-tools # Androd sdk
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/bin # Add my bin to PATH for scripting
#раскрашиваем man
man() {
env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}
#оключаем XON/XOFF flow control
stty -ixon

#добавили autojump 
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh

#настройка todo.txt.cli
source /home/van/src/todo.txt-cli/todo_completion
complete -F _todo t
export TODOTXT_DEFAULT_ACTION=ls

# добавляем алиасы на лету http://bbs.archlinux.org/viewtopic.php?id=151547
alias+ () { 
    if [ $# -eq 2 ]; then 
        echo "alias $1=\"$2\" #alias+" >> ~/.bashrc;
        source ~/.bashrc;
    else 
        source ~/.bashrc; 
        echo ""; echo "alias+: list shortcuts"; echo "alias+ x y: add shortcut"; echo "alias- x: delete a shortcut"; echo ""; 
        grep "^alias " ~/.bashrc | grep "#alias+$" | sed "s/^alias /\x1B[1m/g;s/=\"/\x1B[0m => /g;s/\" #alias+$//g"; echo ""; 
    fi
}

alias- () { 
    (cat ~/.bashrc | grep -v "^alias $1=") > ~/.bashrc.NEW; 
    mv ~/.bashrc.NEW ~/.bashrc; 
    unalias $1;
}

#git aliases
#alias gst='git status'
alias gs='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff | mate'
alias gau='git add --update'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcot='git checkout -t'
alias gcotb='git checkout --track -b'
alias glog='git log'
alias glogp='git log --pretty=format:"%h %s" --graph'
#-----------
alias untar="tar -xf" #alias+
alias agi="sudo apt-get install" #alias+
alias aguu="sudo apt-get update && sudo apt-get upgrade" #alias+
alias mandr="curlftpfs ftp://192.168.1.130:4545 /home/van/andvan" #alias+
alias uandr="sudo fusermount -u /home/van/andvan" #alias+
alias sdeb="sudo dpkg -i" #alias+
alias ipp="ipython --pylab=qt" #alias+
alias hgr="history | grep " #alias+
alias pg="/bin/ps aux | grep" #alias+
#alias gpush="git push origin master" #alias+
alias mkdir="mkdir -pv" #alias+
alias srb="source ~/.bashrc" #alias+
alias stp="mypo &" #alias+
alias pingg="ping -c 3 google.com" #alias+
alias cal="calcurse" #alias+
alias du="ncdu" #alias+
alias top="htop" #alias+
alias t="todo.sh -d /home/van/pr/todo/todo.cfg" #alias+
alias punch="python /home/van/src/punch-time-tracking-1.3/Punch.py" #alias+
alias ta="t add" #alias+
alias pin="punch in" #alias+
alias pin="python /home/van/src/punch-time-tracking-1.3/Punch.py in" #alias+
alias r="ranger" #alias+
alias tt="type" #alias+
