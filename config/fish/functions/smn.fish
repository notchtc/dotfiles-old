function smn -d "Search man pages"
    apropos . | cut -d "(" -f 1 | cut -d "," -f 1 | fzf --multi -q "$argv" --preview "man {1}" | xargs -ro man
end
