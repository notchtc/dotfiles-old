local awful = require("awful")
local beautiful = require("beautiful")

local command = [[
sh -c '
percent=$(pamixer --get-volume)
muted=$(pamixer --get-mute)

if [ "$muted" = "true" ]; then
    icon=婢
else
    if [ "$percent" -ge 55 ]; then
        icon=墳
    elif [ "$percent" -gt 40 ]; then
        icon=奔
    elif [ "$percent" -ge 0 ]; then
        icon=奄
    fi
fi

echo "<span font=\"]] .. beautiful.icon_font .. [[\">$icon</span> $percent% "
'
]]

-- Create volume widget
myvol, myvolTimer = awful.widget.watch(command, 60, function(widget, stdout)
    widget:set_markup(stdout)
    collectgarbage("collect")
end)
