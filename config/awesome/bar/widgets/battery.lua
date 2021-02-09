local wibox = require("wibox")
local beautiful = require("beautiful")
local vicious = require("vicious")

-- Create battery widget
mybat = wibox.widget.textbox()
vicious.register(mybat, vicious.widgets.bat, "<span font=\"" .. beautiful.icon_font .. "\" color=\"" .. beautiful.bg_normal .. "\"> $1 $2% </span>", 36, "BAT1")
