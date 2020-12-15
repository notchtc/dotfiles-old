function smn --description "Search man pages"
	apropos . | fzf -q "$argv" | cut -d "(" -f 1 | xargs -ro man
end

