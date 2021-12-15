set NODE_OPTIONS --max-old-space-size=3072

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
