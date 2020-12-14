function sman
	apropos . | fzf | sed "s/(.*//g" | xargs -r man
end

