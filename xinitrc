pulseaudio &
xrdb -merge ~/.Xresources &
xmodmap -e 'clear lock' -e 'keycode 66 = Escape' -e 'keycode 9 = Caps_Lock' &
exec awesome
