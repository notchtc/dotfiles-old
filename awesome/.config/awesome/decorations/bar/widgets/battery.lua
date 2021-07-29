local awful = require("awful")
local beautiful = require("beautiful")

local command = [[
sh -c '
state=$(acpi | cut -d " " -f 3 | cut -d "," -f 1 | tr "[:upper:]" "[:lower:]")
percent=$(acpi | cut -d " " -f 4 | cut -d "," -f 1)

if [ "$state" = "full" ]; then
    icon=⌁
elif [ "$state" = "charging" ]; then
    icon=⚡
elif [ "$state" = "discharging" ]; then
    icon=❕
fi

echo " <span font=\"]] .. beautiful.icon_font .. [[\">$icon</span> $percent "
'
]]

-- Create battery widget
mybat = awful.widget.watch(command, 27, function(widget, stdout)
    widget:set_markup(stdout)
    collectgarbage("collect")
end)
