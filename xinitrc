pulseaudio &
[ ! -s ~/.config/mpd/pid ] && mpd &
xrdb -merge ~/.Xresources &
xmodmap ~/.config/.xmodmaprc &
exec awesome
