function yr --description="View and remove installed packages with yay"
    yay -Qq | fzf -q "$argv" -m --preview 'yay -Qi {1}' | xargs -ro yay -Rns
end
