#!/bin/bash

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Install homebrew
f test ! $(which brew); then
    echo "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing homebrew packages..."

# Install packages
brew install zsh
brew install tmux
brew install neovim
brew install python3
brew install zsh-syntax-highlighting

# Install casks
brew install font-hack-nerd-font
brew install raycast
brew install rectangle
brew install kitty
brew install docker
brew install spotify


# Clone .dotfiles
mkdir .dotfiles && cd .dotfiles
git clone https://github.com/mariogarzac/dotfiles

echo "Changing system settings..."
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock "mru-spaces" -bool "false"
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false


