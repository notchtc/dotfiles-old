local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")

-- Create volume widget
myvol = awful.widget.watch('sh -c "pamixer --get-volume-human"', 2, function(widget, stdout)
    widget:set_markup("<span font=\"" .. beautiful.icon_font .. "\" color=\"" .. beautiful.bg_normal .. "\">墳 " .. stdout .. "</span>")
    collectgarbage("collect")
end)


myvol:buttons(gears.table.join(
    awful.button({}, 3, nil, function ()
        awful.spawn("pavucontrol")
    end),
    awful.button({}, 1, nil, function ()
        awful.spawn.with_shell("amixer sset Master toggle")
    end),
    awful.button({}, 4, nil, function ()
        awful.spawn.with_shell("amixer sset Master 5%+")
    end),
    awful.button({}, 5, nil, function ()
        awful.spawn.with_shell("amixer sset Master 5%-")
    end)
))

local myvol_t = awful.tooltip {
    objects             = { myvol },
    delay_show          = 1,
    mode                = "outside",
    preferred_positions = "top",
    timer_function = function()
        return "<span color=\"" .. beautiful.bg_focus .. "\">LMB</span> to toggle mute\n<span color=\"" .. beautiful.bg_focus .. "\">RMB</span> to open mixer\n<span color=\"" .. beautiful.bg_focus .. "\">Scroll up</span> to raise volume\n<span color=\"" .. beautiful.bg_focus .. "\">Scroll down</span> to lower volume"
    end,
}
