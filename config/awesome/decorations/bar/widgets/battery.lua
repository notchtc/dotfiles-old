local awful = require("awful")
local beautiful = require("beautiful")

-- Create battery widget
mybat = awful.widget.watch('sh -c \'acpi | cut -d " " -f 3,4 | cut -d "," -f 1,2\'', 25, function(widget, stdout)
    widget:set_markup("<span font=\"" .. beautiful.icon_font .. "\" color=\"" .. beautiful.bg_normal .. "\"> " .. stdout .. "</span>")
    collectgarbage("collect")
end)
