local awful = require("awful")

awful.spawn.once("xrdb -merge $HOME/.Xresources")
awful.spawn.once("setxkbmap -option caps:swapescape")
awful.spawn.once("pulseaudio --start")
awful.spawn.once("[ ! -s ~/.config/mpd/pid ] && mpd")
awful.spawn.once("mpDris2")
