# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Bash completions
# brew install bash-completions
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion


ulimit -S -c 0      # No coredumps.
set -o notify
set -o noclobber
set -o ignoreeof

# Enable options:
shopt -s extglob        # Necessary.
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s cmdhist
shopt -s histappend histreedit histverify
shopt -s nullglob


# Do echo after each command
export PROMPT_COMMAND=''

# Path
export PATH=/usr/bin:/bin:/usr/sbin:/sbin
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=~/bin:$PATH


#-------------------------------------------------------------
# Text and colors
#-------------------------------------------------------------

# Shell colors
#export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
#export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33'
export LS_COLORS='GxFxCxDxBxegedabagaced'

# Colors
export Black='\e[0;30m'
export Red='\e[0;31m'
export Green='\e[0;32m'
#export Green=$(tput setaf 2)
export Yellow='\e[0;33m'
#export Yellow=$(tput setaf 3)
export Blue='\e[0;34m'
export Purple='\e[0;35m'
#export Purple=$(tput setaf 5)
export Cyan='\e[0;36m'

export LBlack='\e[1;30m'
export LRed='\e[1;31m'
export LGreen='\e[1;32m'
export LYellow='\e[1;33m'
export LBlue='\e[1;34m'
export LPurple='\e[1;35m'
export LCyan='\e[1;36m'

export BBlack='\e[1;40m'
export BRed='\e[1;41m'
export BGreen='\e[1;42m'
export BYellow='\e[1;43m'
export BBlue='\e[1;44m'
export BPurple='\e[1;45m'
export BCyan='\e[1;46m'

export White='\e[1;37m'

# Reset
export NC='\e[0m' # No Color
#export NC=$(tput sgr0)

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'



#-------------------------------------------------------------
# Alias
#-------------------------------------------------------------

# Custom aliases

alias cp='cp -v'		# Copy vebose mode
alias cpr='cp -v -r'	# Copy a directory verbose
alias mv='mv -v -f'		# Move vebose
alias c='clear'         # Clear the screen

#-------------------------------------------------------------
# Functions
#-------------------------------------------------------------

# Find a file with a pattern in name
function ff() { find . -type f -iname '*'"$*"'*' -ls ; }

# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }


# When Sudo won't find the binary
function mydo()
{
	echo Executing sudo with: "$1" "${@:2}"
	sudo $(which $1) "${@:2}"
}




# Update bash_profile
function rf()
{
    clear
    printf "\n${Green}Profile updated.\n"
    source $HOME/.bash_profile
    rm $HOME/.bash_profile~ > /dev/null 2>&1
}


# Update bash_profile
function text()
{
    echo
    # Welcome text
    printf "${Green}"
    # Stylish welcome message
    for ((x=0; x<${#1}; x++)); do
        printf "${1:$x:1}"
        #printf ' %.0s' $(seq 0 $x)
        sleep 0.01
    done
    echo
}



#-------------------------------------------------------------
# Prompt & Greetings
#-------------------------------------------------------------

# Title bar black
#echo -n -e "\033]6;;bg;black;brightness;100\a"
#TITLEBAR='\[\033]0;[\u] - [${SHELL} - \V]\007\]'
source ~/.aliases

BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
# Messages

# If id command returns 1, you have root access.
if [ $(id -u) -eq 0 ]; then
    # Root
    export PS1="\[${TITLEBAR}\]\[$Yellow\]«\[$Red\]rØØt\[$Green\][$Yellow\]» \[$NC\]"
    #export PS1="\[${TITLEBAR}\]\[$Yellow\]«\[$Red\]rØØt\[$Green\]\w\[$Yellow\]» \[$NC\]"
else

    export PS1="\[$Yellow\]«\[$Purple\]\[$Green\]\w\[$Yellow\]» \[$NC\]"
    #export PS1="\[$Yellow\] «\[$Purple\] \[$Green\] \w\[$Yellow\]» \[$NC\]"
fi

