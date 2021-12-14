#!/usr/bin/env bash
xcode-select --install

git clone git@github.com/bananashell/dotfiles.git ~/.dotfiles

ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.zshrc ~/.zshrc

#install homebrew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

cd ~/.dotfiles && brew bundle