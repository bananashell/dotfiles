set NODE_OPTIONS --max-old-space-size=3072

function ll
    exa --icons --oneline --all --git-ignore --group-directories-first
end

function lt
    exa --icons --tree --level=2 --all --git-ignore --group-directories-first
end

function gs
    git status
end
