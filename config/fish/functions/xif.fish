function xif --description "View and install packages with xbps"
	xbps-query -Rs [0-9] --regex | cut -d " " -f 2 | fzf -q "$argv" -m --prompt "install: " --preview "xbps-query -RS {1}" | xargs -ro sudo xbps-install -S
end
