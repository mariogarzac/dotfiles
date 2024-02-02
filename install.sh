#!/bin/bash

# Install XCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Install ohmyzsh
echo "Installing ohmyzsh packages..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing powerlevel10k and MesloLGS NF..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

# Install homebrew
echo "Installing homebrew packages..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Clone .dotfiles
echo "Installing dotfiles..."
mkdir ~/.dotfiles && cd ~/.dotfiles
git clone https://github.com/mariogarzac/dotfiles .

# Clone nvim config
echo "Installing nvim config..."
mkdir ~/.config && cd ~/.config
git clone https://github.com/mariogarzac/nvim

# Install packer
echo "Installing packer..."
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "Creating symbolic links..."
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/zsh/.tmux.conf ~/.tmux.conf

mkdir ~/.config/alacritty/
ln -sf ~/.dotfiles/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml

# Install packages
echo "Installing homebrew packages..."
brew install zsh
brew install tmux
brew install neovim
brew install python3
brew install zsh-syntax-highlighting

# Install casks
echo "Installing homebrew casks..."
brew install raycast
brew install alacritty
brew install docker
brew install spotify

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


