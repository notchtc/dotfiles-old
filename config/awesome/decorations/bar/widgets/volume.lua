local awful = require("awful")
local beautiful = require("beautiful")

local command = [[
sh -c '
percent=$(pamixer --get-volume)
muted=$(pamixer --get-volume-human)

if [ "$muted" = "muted" ]; then
    icon=婢
else
    if [ "$percent" -ge 55 ]; then
        icon=墳
    elif [ "$percent" -gt 40 ]; then
        icon=奔
    elif [ "$percent" -gt 0 ]; then
        icon=奄
    elif [ "$percent" -eq 0 ]; then
        icon=ﱝ
    fi
fi

echo "$icon $percent%"
'
]]

-- Create volume widget
myvol, myvolTimer = awful.widget.watch(command, 17, function(widget, stdout)
    widget:set_markup("<span font=\"" .. beautiful.icon_font .. "\" color=\"" .. beautiful.bg_normal .. "\">" .. stdout .. "</span>")
    collectgarbage("collect")
end)
