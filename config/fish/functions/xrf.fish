function xrf
	xbps-query -Rl | cut -d " " -f 1,2 | fzf --preview 'xbps-query -RS {2}' | xargs -ro sudo xbps-remove -R
end
