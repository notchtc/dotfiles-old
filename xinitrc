xrdb -merge $HOME/.Xresources &
setxkbmap pl -option caps:swapescape &
pulseaudio --start &
mpd && mpDris2 &
exec awesome
