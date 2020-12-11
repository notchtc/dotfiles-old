function xrf
	xbps-query -Rl | cut -d " " -f 1,2 | fzf -m --preview 'xbps-query -RS {2}' | cut -d " " -f 2 | xargs -ro sudo xbps-remove -R
end
