function smn -d "Search man pages"
    apropos . | fzf --multi -q "$argv" | cut -d "(" -f 1 | xargs -ro man
end
