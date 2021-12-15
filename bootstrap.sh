#!/usr/bin/env bash
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/config.fish ~/.config/fish/config.fish

#install homebrew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

cd ~/.dotfiles && brew bundle

#VSCode

ln -s ~/.dotfiles/VSCode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/.dotfiles/VSCode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -s ~/.dotfiles/VSCode/snippets/ ~/Library/Application\ Support/Code/User

#Install VSCode Extensions
code --install-extension bradlc.vscode-tailwindcss
code --install-extension christian-kohler.path-intellisense
code --install-extension dbaeumer.vscode-eslint
code --install-extension dracula-theme.theme-dracula
code --install-extension eamodio.gitlens
code --install-extension esbenp.prettier-vscode
code --install-extension github.copilot
code --install-extension humao.rest-client
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-dotnettools.csharp
code --install-extension Orta.vscode-jest
code --install-extension ow.vscode-subword-navigation
code --install-extension WallabyJs.quokka-vscode
code --install-extension wayou.vscode-todo-highlight