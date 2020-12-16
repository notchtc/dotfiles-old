pulseaudio &
xrdb -merge .config/x11/Xresources &
xmodmap -e 'clear lock' -e 'keycode 66 = Escape'
exec awesome
