function xif
	xbps-query -Rs [a-Z] --regex | cut -d " " -f 2 | fzf -m --preview 'xbps-query -RS {1}' | xargs -ro sudo xbps-install -S
end
