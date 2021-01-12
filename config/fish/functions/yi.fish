function yi --description="View and install packages with yay"
    yay -Slq | fzf -q "$argv" -m --preview 'yay -Si {1}'| xargs -ro yay -S
end
