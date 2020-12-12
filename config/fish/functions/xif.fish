function xif
	xbps-query -Rs [0-9] --regex | cut -d " " -f 1,2 | fzf -m --prompt "install> " --preview "xbps-query -RS {2}" | cut -d " " -f 2 | xargs -ro sudo xbps-install -S
end
