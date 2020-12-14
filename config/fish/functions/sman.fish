function sman
	apropos . | fzf | sed "s/(.*//g" | xargs -ro man
end

