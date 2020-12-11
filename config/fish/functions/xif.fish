function xif
	xbps-query -Rs [a-Z] --regex | cut -d " " -f 1,2 | fzf -m --preview 'xbps-query -RS {2}' | cut -d " " -f 2 | xargs -ro sudo xbps-install -S
end
