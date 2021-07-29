local wibox = require("wibox")
local beautiful = require("beautiful")

-- Create a textclock widget
mytextclock = wibox.widget.textclock(" <span font=\"" .. beautiful.icon_font .. "\"></span> %d.%m.%Y %H:%M", 3)
