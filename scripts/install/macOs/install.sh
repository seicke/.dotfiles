#!/bin/zsh
# Get the directory of the current script
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

source "$DIR/defaults.sh"

echo " Updating macOS software..."
sudo softwareupdate -i -a

echo " Installing Xcode Command Line Tools..."
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

echo "🔄 Updating Homebrew..."
brew update

# Install Homebrew stuff
echo "📦 Installing Homebrew packages..."
for pkg in curl git git-extras nano node topgrade wget zsh zsh-autosuggestions zsh-syntax-highlighting; do
    brew list --formula | grep -q "^${pkg}$" || brew install "$pkg"
done

# Install Homebrew Cask stuff
echo "🖥️ Installing Homebrew cask apps..."
for app in adobe-acrobat-reader alfred appcleaner calibre chatgpt claude deepl docker docker-desktop font-consolas-for-powerline font-powerline-symbols font-source-code-pro google-chrome google-drive hazel jdownloader logi-options+ microsoft-auto-update microsoft-teams obsidian the-unarchiver tor-browser virtualbuddy visual-studio-code; do
    brew ls --cask --versions "$app" >/dev/null || brew install --cask "$app"
done

# Cleanup Homebrew
echo "🧹 Cleaning up Homebrew..."
brew cleanup

# Install Oh My zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

source "$PWD/dock.sh"