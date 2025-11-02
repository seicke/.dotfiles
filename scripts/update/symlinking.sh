#!/bin/zsh

ln -sf $HOME'/.dotfiles/.gitignore' $HOME'/.gitignore'
ln -sf $HOME'/.dotfiles/.config/.gitconfig' $HOME'/.gitconfig'
ln -sf $HOME'/.dotfiles/system/.zshrc' $HOME'/.zshrc'
ln -sf $HOME'/.dotfiles/system/.zprofile' $HOME'/.zprofile'

if [[ ! -d "$HOME/.config" ]]; then
    mkdir -p "$HOME/.config"
fi
ln -sf $HOME'/.dotfiles/.config/topgrade.toml' $HOME'/.config/topgrade.toml'