# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# I want vim
export EDITOR='nvim'

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
	# Ensure existing Homebrew v1 completions continue to work
	export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
	source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

for file in ~/.{aliases,spurs_aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

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


# Path
export PATH=/usr/bin:/bin:/usr/sbin:/sbin
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=~/bin:$PATH
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"

#-------------------------------------------------------------
# Text and colors
#-------------------------------------------------------------
# Shell colors
export TERM=xterm-256color
export CLICOLOR=1
#export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33'
export LS_COLORS='GxFxCxDxBxegedabagaced'

# Colors
export Red=$(tput setaf 1)
export Green=$(tput setaf 2) #
export Yellow=$(tput setaf 3)
export Blue=$(tput setaf 4)
export Purple=$(tput setaf 5)
export Black='\e[0;30m'
export Cyan='\e[0;36m'

export NC=$(tput sgr0)
#-------------------------------------------------------------
# Prompt
#-------------------------------------------------------------
# If id command returns 1, you have root access.
if [ $(id -u) -eq 0 ]; then
    # Root
    export PS1="\[${TITLEBAR}\]\[$Yellow\]«\[$Red\]rØØt\[$Green\][$Yellow\]» \[$NC\]"
    #export PS1="\[${TITLEBAR}\]\[$Yellow\]«\[$Red\]rØØt\[$Green\]\w\[$Yellow\]» \[$NC\]"
else

    export PS1="\[$Yellow\]«\[$Purple\]\[$Green\]\w\[$Yellow\]» \[$NC\]"
    #export PS1="\[$Yellow\] «\[$Purple\] \[$Green\] \w\[$Yellow\]» \[$NC\]"
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

