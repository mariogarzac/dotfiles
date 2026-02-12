# Install ohmyzsh
echo "Installing ohmyzsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing zsh extensions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Installing powerlevel10k and MesloLGS NF..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

echo "Downloading tpm..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Run prefix + I inside tmux to install packages"

echo "Creating symbolic links..."
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/zsh/.tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/config/i3/config ~/.config/i3/config
ln -sf ~/.dotfiles/config/display/.xsessionrc ~/.xsessionrc

echo "Downloading go1.25.1 (might not be the latest version)..."
wget https://go.dev/dl/go1.25.1.linux-amd64.tar.gz
echo "run as sudo 'sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.25.1.linux-amd64.tar.gz'"

echo "Downloading neovim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
git clone https://github.com/mariogarzac/nvim ~/.config/nvim

echo "sudo apt-get install zsh tmux ripgrep clang fzf tree feh rofi -y"

sudo pacman -S tmux ripgrep clang fzf tree feh rofi -y
sudo pacman -S clang
sudo pacman -S base-devl
sudo pacman -S base-devel
sudo pacman -S glibc linux-api-headers gcc
sudo pacman -S kde-cli-tools
