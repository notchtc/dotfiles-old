local wibox = require("wibox")
local beautiful = require("beautiful")

-- Create a textclock widget
mytextclock = wibox.widget.textclock(" <span font=\"" .. beautiful.icon_font .. "\" color=\"" .. beautiful.fg_normal .. "\"> %d.%m.%Y %H:%M</span>", 3)
