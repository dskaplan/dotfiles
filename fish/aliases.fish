# Python stuffs
alias python='python3'
alias py='python3'
alias py2='python2'
alias pip='pip3'
alias pyserv='python3 -m http.server'
alias jnb='jupyter notebook'
alias pya='python3 app.py'

# Apps
alias tm='tmux'
alias tmkill='pkill -f tmux'
alias smelt='source ~/.config/fish/config.fish'
# Terminal
alias tree='exa --tree'
alias l='exa -lah -G  --color-scale --group-directories-first'
alias lsd='exa -lF'
alias gc="git clone"
alias bk="cd ../"
alias bkk="cd ../../"
alias cp='cp -v'		# Copy vebose mode
alias cpr='cp -v -r'	# Copy a directory verbose
alias mv='mv -v'		# Move vebose
alias c='clear'         # Clear the screen
alias dl="cd ~/Downloads"
alias docs='cd ~/Documents'
alias chmox='chmod -x'

# Show what is being weird
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'
alias mem_hogs='top -l 1 -o rsize | head -20'

# Update pip, this is bad lol.
alias pipup="pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U"
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'
alias brews='brew search'
# Clear some junk files so that my machine is happier 
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"
# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"
# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
# Open finder here
alias f="open ."

# Gimme the weather in Charlotte
alias wclt='curl wttr.in/charlotte'

# Reload the shell 
# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Print each PATH entry on a separate line

# Spam vim stuff
alias vv='nvim'
alias vim='nvim'
alias v='nvim'
alias nm='nvim'

