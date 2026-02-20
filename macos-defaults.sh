#!/usr/bin/env bash
# ============================================================
# macOS Defaults - Quality of life tweaks
# These are safe, reversible preferences
# ============================================================

# Finder: Show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder: Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: Default to list view
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Finder: Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Dock: Minimize windows into app icon
defaults write com.apple.dock minimize-to-application -bool true

# Dock: Autohide the Dock
defaults write com.apple.dock autohide -bool true

# Dock: Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Dock: Speed up the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0.3

# Trackpad: Enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Keyboard: Fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Screenshots: Save to ~/Desktop/Screenshots
mkdir -p "$HOME/Desktop/Screenshots"
defaults write com.apple.screencapture location -string "$HOME/Desktop/Screenshots"

# Screenshots: Disable shadow
defaults write com.apple.screencapture disable-shadow -bool true

# Safari: Show the full URL in the address bar
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# TextEdit: Use plain text mode by default
defaults write com.apple.TextEdit RichText -int 0

echo "  ℹ  Some changes require a logout/restart to take effect."
