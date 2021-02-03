function yi --description="View and install packages with paru"
    paru -Slq | fzf -q "$argv" -m --preview 'paru -Si {1}' | tr "\n" " " | xargs -ro paru -S
end
