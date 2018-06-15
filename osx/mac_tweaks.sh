#!/usr/bin/env bash

# Current User
user=$(id -un)

# Script's color palette
reset="\033[0m"
highlight="\033[42m\033[97m"
dot="\033[33m▸ $reset"
dim="\033[2m"
bold="\033[1m"

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

headline() {
    printf "${highlight} %s ${reset}\n" "$@"
}

chapter() {
    echo "${highlight} $((count++)).) $@ ${reset}\n"
}

# Prints out a step, if last parameter is true then without an ending newline
step() {
    if [ $# -eq 1 ]
    then echo "${dot}$@"
    else echo "${dot}$@"
    fi
}

run() {
    echo "${dim}▹ $@ $reset"
    eval $@
}

echo ""
headline " Let's secure your Mac and install basic applications."
echo ""
echo "Modifying settings for user: $user."
# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
if [ $(sudo -n uptime 2>&1|grep "load"|wc -l) -eq 0 ]
then
    step "Some of these settings are system-wide, therefore we need your permission."
    sudo -v
    echo ""
fi

step "Setting your computer name (as done via System Preferences → Sharing)."



#
# OSX GENERAL TWEAKS
# 

## FINDER 


# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
run write com.apple.finder QuitMenuItem -bool true
# Finder: show status bar
run defaults write com.apple.finder ShowStatusBar -bool true
# Finder: show path bar
run defaults write com.apple.finder ShowPathbar -bool true
# "Show all filename extensions."
run defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# "Disable the warning when changing a file extension."
run defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# "Use list view in all Finder windows by default."
run defaults write com.apple.finder FXPreferredViewStyle -string '"Nlsv"'
# "Show the ~/Library folder."
run chflags nohidden ~/Library
# "Show the /Volumes folder."
run sudo chflags nohidden /Volumes
# "Show hidden files in finder."
run defaults write com.apple.finder AppleShowAllFiles -int 1
# "Show full file path in finder windows."
run defaults write _FXShowPosixPathInTitle com.apple.finder -int 1
# "Save screenshots in PNG format."
run defaults write com.apple.screencapture type -string png
# "Save screenshots to user screenshots directory instead of desktop."
run mkdir ~/screenshots
run defaults write com.apple.screencapture location -string ~/screenshots

## VISUAL 

# "Speed up mission control animations."
run defaults write com.apple.dock expose-animation-duration -float 0.1
# "Remove the auto-hiding dock delay."
run defaults write com.apple.dock autohide-delay -int 0
# "Use the dark theme."
run defaults write ~/Library/Preferences/.GlobalPreferences AppleInterfaceStyle -string "Dark"
# "Disable menu transparency."
run defaults write com.apple.universalaccess reduceTransparency -int 1
# Disable Dashboard
run defaults write com.apple.dashboard mcx-disabled -bool true
# Don’t show Dashboard as a Space
run defaults write com.apple.dock dashboard-in-overlay -bool true
# Don’t automatically rearrange Spaces based on most recent use
run defaults write com.apple.dock mru-spaces -bool false
# "Disable sudden motion sensor. (Not useful for SSDs)."
run sudo pmset -a sms 0


## MISC

# "Disable crash reporter."
run defaults write com.apple.CrashReporter DialogType none
# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

## Sound

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "
# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40


## Save settings

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

## Keyboard/Mouse 

# "Disable press-and-hold for keys in favor of key repeat."
run defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# "Set a fast keyboard repeat rate, after a good initial delay."
run defaults write NSGlobalDomain KeyRepeat -int 1
run defaults write NSGlobalDomain InitialKeyRepeat -int 25
# Disable “natural” (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false


#
# Transmission
#

# Use `~/Downloads` to store completed downloads
defaults write org.m0k.transmission DownloadLocationConstant -bool true
# Don’t prompt for confirmation before removing non-downloading active transfers
defaults write org.m0k.transmission CheckRemoveDownloading -bool true
# Trash original torrent files
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true
# Hide the donate message
defaults write org.m0k.transmission WarningDonate -bool false
# Hide the legal disclaimer
defaults write org.m0k.transmission WarningLegal -bool false
# Randomize port on launch
defaults write org.m0k.transmission RandomPort -bool true



# 
# iTerm
# 

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

for app in "Activity Monitor" \
      "Address Book" \
      "Calendar" \
      "cfprefsd" \
      "Dock" \
      "Finder" \
      "Google Chrome" \
      "Photos" \
      "SystemUIServer" \
      "iCal"; do
      killall "${app}" &> /dev/null
done

chapter "Some settings will not take effect until you restart your computer."
headline " Your Mac is setup and ready!"
