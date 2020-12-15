function smn -d "Search man pages"
    apropos . | fzf --no-multi -q "$argv" | cut -d "(" -f 1 | xargs -ro man
end

