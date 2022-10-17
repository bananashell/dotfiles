set NODE_OPTIONS --max-old-space-size=3072
nvm use lts

function ll
    exa --icons --all --git-ignore --group-directories-first $argv
end

function lt
    exa --icons --tree --level=2 --all --git-ignore --group-directories-first $argv
end

function ld
    exa --icons --all --git-ignore --group-directories-first --only-dirs $argv
end

function gs
    git status
end

function gitp
    echo Deleting dead branches
    git fetch -p && git branch --merged | egrep -v "(^\*|master|develop)" | xargs git branch -d
    git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -d
end

function gitphard
    echo Hard deleting dead branches
    git fetch -p && git branch --merged | egrep -v "(^\*|master|develop)" | xargs git branch -D
    git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D
end

function sln
    dotnet new sln
    dotnet sln add (ls -r **/*.csproj)
end

function cd..
    cd ..
end

function stardaw
    cd ~/localcode/starmony/StarDaw
end

function keyvault -a name -a vault
    if test -z "$vault"
        set vault star-deploy-keys-dev
    end
    echo Fetching $name from $vault
    az keyvault secret show --name $name --vault-name $vault | jq '.value'
end

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh" # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion


starship init fish | source
