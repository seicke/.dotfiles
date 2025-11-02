#!/bin/zsh

dockutil --no-restart --remove all
dockutil --no-restart --add "/System/Applications/Utilities/Terminal.app" >/dev/null
dockutil --no-restart --add "/System/Applications/Music.app" >/dev/null
dockutil --no-restart --add "/System/Applications/Messages.app" >/dev/null
dockutil --no-restart --add "/System/Applications/Notes.app" >/dev/null
dockutil --no-restart --add "/Applications/Obsidian.app" >/dev/null
dockutil --no-restart --add "/System/Applications/Calendar.app" >/dev/null
dockutil --no-restart --add "/System/Applications/Reminders.app" >/dev/null
dockutil --no-restart --add "/System/Applications/Mail.app" >/dev/null
dockutil --no-restart --add "/Applications/Safari.app" >/dev/null
dockutil --no-restart --add "/Applications/Visual Studio Code.app" >/dev/null

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool false

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# No bouncing icons
defaults write com.apple.dock no-bouncing -bool true

# Don't show recently used applications in the Dock
defaults write com.Apple.Dock show-recents -bool false

echo "⏳ Waiting for Dock to restart."
killall Dock

while ! pgrep -x "Dock" >/dev/null; do sleep 0.1; done
echo "✅ Dock restarted and settings applied."