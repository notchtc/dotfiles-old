local awful = require("awful")
local beautiful = require("beautiful")

-- Create volume widget
myvol, myvolTimer = awful.widget.watch('sh -c "pamixer --get-volume-human"', 17, function(widget, stdout)
    widget:set_markup("<span font=\"" .. beautiful.icon_font .. "\" color=\"" .. beautiful.bg_normal .. "\">墳 " .. stdout .. "</span>")
    collectgarbage("collect")
end)
