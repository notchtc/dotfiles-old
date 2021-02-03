function yr --description="View and remove installed packages with paru"
    paru -Qq | fzf -q "$argv" -m --preview 'paru -Qi {1}' | tr "\n" " " | xargs -ro paru -Rns
end
