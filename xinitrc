[ ! -s ~/.config/mpd/pid ] && mpd &
xrdb -merge ~/.Xresources &
setxkbmap -option caps:swapescape &
xset r rate 400 28 &
exec awesome
