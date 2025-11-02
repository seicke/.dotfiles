#!/bin/zsh

dockutil --no-restart --remove all
dockutil --no-restart --add "/System/Applications/Utilities/Terminal.app"
dockutil --no-restart --add "/System/Applications/Music.app"
dockutil --no-restart --add "/System/Applications/Messages.app"
dockutil --no-restart --add "/System/Applications/Notes.app"
dockutil --no-restart --add "/Applications/Obsidian.app"
dockutil --no-restart --add "/System/Applications/Calendar.app"
dockutil --no-restart --add "/System/Applications/Reminders.app"
dockutil --no-restart --add "/System/Applications/Mail.app"
dockutil --no-restart --add "/System/Applications/Safari.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# No bouncing icons
defaults write com.apple.dock no-bouncing -bool true

# Don't show recently used applications in the Dock
defaults write com.Apple.Dock show-recents -bool false

killall Dock

while ! pgrep -x "Dock" >/dev/null; do sleep 0.1; done
echo "✅ Dock restarted and settings applied."