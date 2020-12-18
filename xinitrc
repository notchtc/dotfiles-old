pulseaudio &
[ ! -s ~/.config/mpd/pid ] && mpd &
mpDris2 &
xrdb -merge ~/.Xresources &
xmodmap ~/.config/.xmodmaprc &
exec awesome
