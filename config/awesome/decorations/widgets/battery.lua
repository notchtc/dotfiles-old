local awful = require("awful")
local beautiful = require("beautiful")

local command = [[
sh -c '
state=$(acpi | cut -d " " -f 3 | cut -d "," -f 1)
percent=$(acpi | cut -d " " -f 4 | cut -d "," -f 1)

if [ "$state" = "Full" ]; then
    icon=
elif [ "$state" = "Charging" ]; then
    icon=
elif [ "$state" = "Discharging" ]; then
    icon=
fi

echo "$icon $percent"
'
]]

-- Create battery widget
mybat = awful.widget.watch(command, 25, function(widget, stdout)
    widget:set_markup("<span font=\"" .. beautiful.icon_font .. "\" color=\"" .. beautiful.bg_normal .. "\">" .. stdout .. "</span>")
    collectgarbage("collect")
end)
