xrdb -merge $HOME/.Xresources &
setxkbmap pl -option caps:swapescape &
pulseaudio --start &
[ ! -s ~/.config/mpd/pid ] && mpd &
[ ! -s ~/.config/mpd/pid ] && mpDris2 &
exec awesome
