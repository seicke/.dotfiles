#!/bin/zsh

source ./scripts/defaults.sh

echo "Updating macOS software..."
sudo softwareupdate -i -a

echo "Installing Xcode Command Line Tools..."
xcode-select --install

# Check if Homebrew is installed
if ! command -v brew >/dev/null 2>&1; then
    echo "🍺 Installing Homebrew..."

    # Run the official Homebrew installer
    /bin/bash -c "$(curl -fsSL "https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh?nocache=$(date +%s)")"

    echo "✅ Homebrew installation complete."
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    source ~/.zprofile

    echo "🍺 Installing Homebrew Cask..."
    brew install caskroom/cask/brew-cask
fi

echo "Updating Homebrew..."
brew update

# Install Homebrew stuff
echo "Installing brew stuff..."
brew install curl
brew install git
brew install git-extras
brew install nano
brew install node
brew install topgrade
brew install wget
brew install zsh
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

# Install Homebrew Cask stuff
echo "Installing brew cask stuff..."
brew install --cask adobe-acrobat-reader
brew install --cask alfred
brew install --cask appcleaner
brew install --cask calibre
brew install --cask chatgpt
brew install --cask claude
brew install --cask deepl
brew install --cask docker
brew install --cask docker-desktop
brew install --cask font-consolas-for-powerline
brew install --cask font-powerline-symbols
brew install --cask font-source-code-pro
brew install --cask google-chrome
brew install --cask google-drive
brew install --cask hazel
brew install --cask jdownloader
brew install --cask logi-options+
brew install --cask microsoft-auto-update
brew install --cask microsoft-teams
brew install --cask obsidian
brew install --cask the-unarchiver
brew install --cask tor-browser
brew install --cask virtualbuddy
brew install --cask visual-studio-code

# Cleanup Homebrew
brew cleanup --cask
brew cleanup

# Install Oh My zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

source ./scripts/dock.sh