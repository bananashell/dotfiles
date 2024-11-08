export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="/Users/bananashell/.bun/bin:$PATH"
export PATH="$PATH:/Users/bananashell/.dotnet/tools"

export GITHUB_NPM_TOKEN="INSERT TOKEN HERE"

alias gs="git status"
alias c="code"
alias localcode="cd ~/localcode"

function gitp {
    status_output=$(git status 2>&1)
    if [[ $? -ne 0 ]]; then
        echo "Not a git repository"
        return 1
    fi

    echo Deleting dead branches
    if git show-ref --quiet refs/remotes/origin/master; then
      git checkout master
    elif git show-ref --quiet refs/remotes/origin/main; then
      git checkout main
    else
      echo "No master or main branch found"
      return 1
    fi
    git pull
    git fetch -p
    git branch --merged | egrep -v "(^\*|master|main|develop)" | xargs git branch -d
    git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -d
}

alias ld="eza -lD"
alias lf="eza -lf --color=always | grep -v /"
alias lh="eza -dl .* --group-directories-first"
alias ll="eza --all --tree --level=1 --group-directories-first"
alias ls="eza --all --tree --level=1 --group-directories-first --git-ignore"
alias lt="eza -al --sort=modified"

alias myip="curl ifconfig.me | pbcopy"
