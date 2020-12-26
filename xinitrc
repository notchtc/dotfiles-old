[ ! -s ~/.config/mpd/pid ] && mpd &
xrdb -merge ~/.Xresources &
setxkbmap -option caps:swapescape &
pulseaudio --daemonize --start &
exec awesome
