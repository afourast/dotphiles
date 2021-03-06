# ~/.bashrc: executed by bash(1) for non-login shells.
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
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
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
#force_color_prompt=yes

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

########################## moterunner #################
export PATH=~/installed_software/moterunner/linuxmatlab/bin:$PATH
export LD_LIBRARY_PATH=~/installed_software/moterunner/linux64/bin:/$LD_LIBRARY_PATH
#######################################################	

########################## editor #################
export EDITOR=vim

#######################################################
## Git highlighting script ##

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"

__git_ps1 () 
{ 
  local b="$(git symbolic-ref HEAD 2>/dev/null)";
  if [ -n "$b" ]; then
    printf " (%s)" "${b##refs/heads/}";
  fi
}

function proml {
  local        BLUE="\[\033[0;34m\]"
  local        LIGHT_BLUE="\[\033[1;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local      YELLOW="\[\033[0;33m\]"
  local LIGHT_YELLOW="\[\033[1;33m\]"
  local        CYAN="\[\033[0;36m\]"
  local  LIGHT_CYAN="\[\033[1;36m\]"
  local      MAGENTA="\[\033[0;35m\]"
  local  LIGHT_MAGENTA="\[\033[1;35m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  local     DEFAULT="\[\033[0m\]"

  local start_smooth="╭─"
  local stop_smooth="╰─▪"

  #PS1="\u@\h:\w$LIGHT_RED\$(__git_ps1)$DEFAULT\$ "
  PS1="$MAGENTA$start_smooth$LIGHT_CYAN\u$LIGHT_RED@$LIGHT_MAGENTA\h$MAGENTA:$LIGHT_BLUE[$LIGHT_BLUE\w$LIGHT_RED\$(__git_ps1)$LIGHT_BLUE]\n$DEFAULT$MAGENTA$stop_smooth $DEFAULT"
}

proml

#################################### Git-State Prompt old #################################
#export GIT_PS1_SHOWDIRTYSTATE=1
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;0m\]\u@\h\[\033[00m\]:\[\033[01;0m\]\w\[\033[00m\]\[\033[0;31m\]$(__git_ps1) \[\033[01;0m\]$ '

#git_assume_unchanged_dir() {
  #git ls-files $1 | tr "\n" " " | xargs git update-index --assume-unchanged
#}
#alias git-tmp-off=git_assume_unchanged_dir 

#git_no_assume_unchanged_dir() {
  #git ls-files $1 | tr "\n" " " | xargs git update-index --no-assume-unchanged
#}
#alias git-tmp-on=git_no_assume_unchanged_dir 


#################################### infinite bash history #################################
export HISTFILESIZE=
export HISTSIZE=
#######################################################

#################################### android sdk #################################
export PATH=~/.android-studio/sdk/tools:~/.android-studio/sdk/platform-tools:$PATH #######################################################

#################################### aliases ################################
alias duhs='du -sch .[!.]* * |sort -h'
alias countlinesjava='find . -name "*.java" | xargs wc -l'
alias incvol="pactl -- set-sink-volume 0 200%" 
alias tar-gz='tar czf'
alias tar-bz2='tar cjf'
alias untar-gz='tar xzf'
alias untar-bz2='tar xjf'
#######################################################

#################################### texlive ################################
export PATH=/usr/local/texlive/2014/bin/x86_64-linux:$PATH
####################################################################

#local bash customization
source .bashrc.local 2> /dev/null
