function xrf
	xbps-query -l | cut -d " " -f 1,2 | fzf -m --prompt "remove> " --preview "xbps-query -RS {2}" | cut -d " " -f 2 | xargs -ro sudo xbps-remove -R
end
