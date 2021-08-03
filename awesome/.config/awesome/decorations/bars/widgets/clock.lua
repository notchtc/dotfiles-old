local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

-- Create a textclock widget
mytextclock = wibox.widget.textclock(" <span font=\"" .. beautiful.icon_font .. "\"></span> %d.%m.%Y %H:%M", 3)

-- Calendar
mytextclock:buttons(gears.table.join(
    mytextclock:buttons(),
    awful.button({}, 1, nil, function()
        awful.spawn.with_shell("pkill gnome-calendar || gnome-calendar")
    end)
))
