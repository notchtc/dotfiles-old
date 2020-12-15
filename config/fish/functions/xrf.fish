function xrf
	xbps-query -l | cut -d " " -f 2 | fzf -q "$argv" -m --prompt "remove: " --preview "xbps-query -RS {1}" | xargs -ro sudo xbps-remove -R
end
