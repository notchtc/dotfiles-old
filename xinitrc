[ ! -s ~/.config/mpd/pid ] && mpd &
xrdb -merge ~/.Xresources &
setxkbmap -option caps:swapescape &
exec awesome
