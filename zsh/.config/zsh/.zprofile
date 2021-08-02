# I use this file to launch X11, it is read at login before .zshrc.

if [[ "$(tty)" = "/dev/tty1" ]]; then
    pgrep "$WM" || startx ${XINITRC:="$HOME/.xinitrc"}
fi
