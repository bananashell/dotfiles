export PATH=/opt/homebrew/bin:~/.dotnet/tools:$PATH
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

eval "$(starship init zsh)"

alias localcode="cd ~/localcode"
alias stardaw="cd ~/localcode/starmony/stardaw"
alias gs="git status"
alias ll="exa --icons --all --tree --level=1 --git-ignore --group-directories-first $argv"
alias ld="exa --icons --tree --level=2 --all --git-ignore --group-directories-first $argv"
alias cd..="cd .."
alias pr="open https://dev.azure.com/starmony/TakeOff/_git/StarDaw/pullrequests"
alias k9s-dev="k9s --context instinctive-thaleia-dev"
alias k9s-prod="k9s --context unsuitable-dike-prod"
alias k9s-prod-2="k9s --context instinctive-thaleia-prod"
alias pn="pnpm"

gitp() {
    echo Deleting dead branches
    git checkout master
    git pull
    git fetch -p
    git branch --merged | egrep -v "(^\*|master|develop)" | xargs git branch -d
    git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -d
}

sln() {
    dotnet new sln
    dotnet sln add $(ls -r **/*.csproj)
}

keyvault() {
  name=$1
  vault=star-deploy-keys-dev

  if [ $2 = "--prod" ]; then
    vault=star-deploy-keys-prod
  fi

  echo Fetching $name from $vault
  az keyvault secret show --name $name --vault-name $vault | jq '.value'
}

eval $(thefuck --alias)
