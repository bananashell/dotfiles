#!/usr/bin/env bash
xcode-select --install

git clone git@github.com/bananashell/dotfiles.git ~/.dotfiles

ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.zshrc ~/.zshrc

ln -s ~/.dotfiles/VSCode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/.dotfiles/VSCode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -s ~/.dotfiles/VSCode/snippets/ ~/Library/Application\ Support/Code/User

#install homebrew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

cd ~/.dotfiles && brew bundle