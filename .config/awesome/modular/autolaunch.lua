-- Imports
local awful = require("awful")

awful.spawn.with_shell("xrdb -merge .Xresources")
awful.spawn.with_shell("compton")
