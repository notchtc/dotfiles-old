local beautiful = require("beautiful")
local wibox = require("wibox")
local vicious = require("vicious")

mympd = wibox.widget.textbox()
vicious.register(mympd, vicious.widgets.mpd, "<span color=\"" .. beautiful.bg_normal .. "\" font=\"" .. beautiful.icon_font .. "\"> ${Artist} - ${Title}</span>", 11)
