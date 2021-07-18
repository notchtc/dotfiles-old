if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep "$WM" || startx ${XINITRC:="$HOME/.xinitrc"}
fi
