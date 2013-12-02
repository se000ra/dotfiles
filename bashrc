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

#[ -d ~/.history ] || mkdir --mode=0700 ~/.history
#[ -d ~/.history ] && chmod 0700 ~/.history
#HISTFILE=~/.history/history.$$
# close any old history file by zeroing HISTFILESIZE  
#HISTFILESIZE=0 

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000000
HISTFILESIZE=200000000
HISTTIMEFORMAT="%F %T %t"
HISTIGNORE='history'
#write (-a) and then re-read (-n) the history each time 
#PROMPT_COMMAND="history -na"
#PROMPT_COMMAND="history -a; history -c; history -r"

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

    # Virtual Env
    local VEN=""
    if [[ $VIRTUAL_ENV != "" ]]
       then
           #VEN=" ${RED}(${VIRTUAL_ENV##*/})"
           VEN="(${VIRTUAL_ENV##*/})"
    else
       VEN=''
    fi

    #local BC="╚("#₪₪├i┐└┴┬├─╟┼─╼卐→│└──>─■_╼ )─╼╰ _╭echo "⮀ ± ⭠ ➦ ✔ ✘ ⚡"(
    #local BC="╚═"╞╟╚╔╩╦╠═ ╬⇐ ╬⇒ …»»☭   ╾──╼>      ╰▬═►
    local TC="╭"
    local BC="╰╼ "

    PROMPT="${TIME} ${GP} $ERRPROMPT ${CURENT_PATH}"
    PROMPT="${TIME}${VEN} ${GP} $ERRPROMPT ${CURENT_PATH}"
    local SEPARATOR=""
    let FILLS=${COLUMNS}-${#PROMPT}+0-2
    for (( i=0; i<$FILLS; i++ )) do
        SEPARATOR=$SEPARATOR"─"
    done

    #TOP_LINE="${DKGRAY}${TC}(${CYAN}${TIME}${DKGRAY})${RED}$ERRPROMPT${GREEN}${GP} ${GRAY}${CURENT_PATH} ${DKGRAY}${SEPARATOR}"
    TOP_LINE="${DKGRAY}${TC}(${CYAN}${TIME}${DKGRAY})${RED}${VEN}$ERRPROMPT${GREEN}${GP} ${GRAY}${CURENT_PATH} ${DKGRAY}${SEPARATOR}"
    local BOTTOM_LINE="${DKGRAY}${BC} ${DEFAULT}"
    export PS1="${TOP_LINE}\n${BOTTOM_LINE}"
}
PROMPT_COMMAND=prompt_command

#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
#export PROMPT_COMMAND="history -a; $PROMPT_COMMAND; history -n"
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND; "

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

#PATH=$PATH:$HOME/src/android-sdk-linux/tools # Androd sdk
#PATH=$PATH:$HOME/src/android-sdk-linux/platform-tools # Androd sdk
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/bin # Add my bin to PATH for scripting
PATH=$PATH:$HOME/.local/bin # Add my bin to PATH for scripting
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
#красим less
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '

#заменяем less на vimpager
#export PAGER=/usr/local/bin/vimpager

#оключаем XON/XOFF flow control
stty -ixon

#добавили autojump 
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh

#настройка todo.txt.cli
source /home/van/src/todo.txt-cli/todo_completion
complete -F _todo t
export TODOTXT_DEFAULT_ACTION=ls
export TODO_DIR="/home/van/pr/todo"

# test find and kill http://brettterpstra.com/2009/11/14/fk-a-useful-bash-function/
fp () { #find and list processes matching a case-insensitive partial-match string
        #ps Ao pid,comm|awk '{match($0,/[^\/]+$/); print substr($0,RSTART,RLENGTH)": "$1}'|grep -i $1|grep -v grep
        ps -eo pid,command|awk '{match($0,/[^\/]+$/); print substr($0,RSTART,RLENGTH)": "$1}'|grep -i $1|grep -v grep
}

fk () { # build menu to kill process
    IFS=$'\n'
    PS3='Kill which process? '
    select OPT in $(fp $1) "Cancel"; do
        if [ $OPT != "Cancel" ]; then
            kill $(echo $OPT|awk '{print $NF}')
        fi
        break
    done
    unset IFS
}


# view images in the console
#w3mimg () { w3m -o imgdisplay=/usr/lib/w3m/w3mimgdisplay $1 }

#красим cheat sheets
export CHEATCOLORS=true

#add CLI apps name to window title http://www.davidpashley.com/articles/xterm-titles-with-bash/
#trap 'echo -e "\e]0;$BASH_COMMAND\007"' DEBUG

# http://madebynathan.com/2011/10/04/a-nicer-way-to-use-xclip/
# A shortcut function that simplifies usage of xclip.
# - Accepts input from either stdin (pipe), or params.
# ------------------------------------------------
cb() {
  local _scs_col="\e[0;32m"; local _wrn_col='\e[1;31m'; local _trn_col='\e[0;33m'
  # Check that xclip is installed.
  if ! type xclip > /dev/null 2>&1; then
    echo -e "$_wrn_col""You must have the 'xclip' program installed.\e[0m"
  # Check user is not root (root doesn't have access to user xorg server)
  elif [[ "$USER" == "root" ]]; then
    echo -e "$_wrn_col""Must be regular user (not root) to copy a file to the clipboard.\e[0m"
  else
    # If no tty, data should be available on stdin
    if ! [[ "$( tty )" == /dev/* ]]; then
      input="$(< /dev/stdin)"
    # Else, fetch input from params
    else
      input="$*"
    fi
    if [ -z "$input" ]; then  # If no input, print usage message.
      echo "Copies a string to the clipboard."
      echo "Usage: cb <string>"
      echo "       echo <string> | cb"
    else
      # Copy input to clipboard
      echo -n "$input" | xclip -selection c
      # Truncate text for status
      if [ ${#input} -gt 80 ]; then input="$(echo $input | cut -c1-80)$_trn_col...\e[0m"; fi
      # Print status.
      echo -e "$_scs_col""Copied to clipboard:\e[0m $input"
    fi
  fi
}

# добавляем алиасы налету http://bbs.archlinux.org/viewtopic.php?id=151547
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

alias ga='git add '
alias gaa='git add . '
alias gau='git add --update'

alias gb='git branch'
alias gba='git branch -a'

#alias gl='git pull'
#alias gp='git push'

alias gd='git diff'

alias gc='git commit -v'
alias gca='git commit -v -a'

alias go='git checkout'
alias gob='git checkout -b'
#alias gcot='git checkout -t'
#alias gcotb='git checkout --track -b'
alias glog='git log'
alias glogp='git log --pretty=format:"%h %s" --graph'
alias glogpa='git log --pretty=format:"%h %s" --graph --all'

alias gti='git'
alias g='git'
complete -F _git g
#-----------
# Aliases / functions leveraging the cb() function
# ------------------------------------------------
# Copy contents of a file
function cbf() { cat "$1" | cb; }  
# Copy SSH public key
#alias cbssh="cbf ~/.ssh/id_rsa.pub"  
# Copy current working directory
#alias cbwd="pwd | cb"  
# Copy most recent command in bash history
alias cbh="cat $HISTFILE | tail -n 1 | cb"
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
#alias stp="mypo &" #alias+
alias pingg="ping -c 3 google.com" #alias+
alias cal="calcurse" #alias+
alias du="ncdu" #alias+
alias top="htop" #alias+
alias t="todo.sh -d /home/van/pr/todo/todo.cfg" #alias+
alias punch="python /home/van/src/punch-time-tracking-1.3/Punch.py" #alias+
alias ta="t add" #alias+
alias pin="punch in" #alias+
alias r="ranger" #alias+
alias tt="van_todo_curses" #alias+
alias mkdri="mkdir" #alias+
alias vimes="vim -u /home/van/dotfiles/essential.vim" #alias+
alias spi="sudo pip install" #alias+
alias yff="youtube-dl -f 18 -cwti " #alias+
alias auext="mplayer -dumpaudio -dumpfile " #alias+
alias torba="sh /home/van/soft/torbr/tor-browser_en-US/start-tor-browser" #alias+
alias s="selfstats" #alias+
alias agr="alias | grep " #alias+
alias pipu="pip install --upgrade --user " #alias+
alias u="history -n" #alias+
alias chbook="chmod 644 /media/mystaff/flibook/*" #alias+
#alias yfa="yff -x $(xclip -o)" #alias+
#alias yfd="yff $(xclip -o)" #alias+
alias trd="transmission-daemon -g /home/van/.config/transmission" #alias+
alias trc="transmission-remote-cli" #alias+
alias v="vim" #alias+
alias sub="subliminal -l en ru -- " #alias+
alias hh="history 10" #alias+
alias vless="vim -u /usr/share/vim/vim71/macros/less.vim" #alias+
alias vless="vim -u /home/van/.vim/bundle/vim-colorschemes/colors/less.vim" #alias+
alias yd="youtube-dl -f 18 -cwi -o '/home/van/mystaff/dvid/%(uploader)s-%(upload_date)s-%(title)s-%(id)s.%(ext)s'" #alias+
alias yds="youtube-dl -f 18 -cwi -o '/home/van/mystaff/dvid/%(uploader)s-%(upload_date)s-%(title)s-%(id)s.%(ext)s'" #alias+
alias yda="youtube-dl -f 18 -cwix -o '/home/van/mystaff/dvid/%(uploader)s-%(upload_date)s-%(title)s-%(id)s.%(ext)s'" #alias+
alias yda="youtube-dl -f 18 -cwix -o '/home/van/mystaff/dvid/%(uploader)s-%(upload_date)s-%(title)s-%(id)s.%(ext)s' --download-archive '/home/van/mystaff/dvid/.yout_dl_archive'" #alias+
alias ydam="youtube-dl -f 18 -cwix -o '/home/van/mystaff/dvid/%(uploader)s-%(upload_date)s-%(title)s-%(id)s.%(ext)s' --download-archive '/home/van/mystaff/dvid/.yout_dl_archive' --dateafter now-1months" #alias+
alias yd="youtube-dl -f 18 -cwi -o '/home/van/mystaff/dvid/%(uploader)s-%(upload_date)s-%(title)s-%(id)s.%(ext)s' --download-archive '/home/van/mystaff/dvid/.yout_dl_archive'" #alias+
alias trdc="trd; trc" #alias+
alias ttt="vim /home/van/pr/todo/todo.txt" #alias+
