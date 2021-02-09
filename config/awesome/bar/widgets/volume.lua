local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local vicious = require("vicious")

-- Create volume widget
myvol = wibox.widget.textbox()
vicious.register(myvol, vicious.widgets.volume,
    function (widget, args)
        local label = { ["🔉"] = "墳", ["🔈"] = "奄" }
        return ("<span font=\"" .. beautiful.icon_font .. "\" color=\"" .. beautiful.bg_normal .. "\"> %s %d%% </span>"):format(
            label[args[2]], args[1])
    end, 1, "Master")

myvol:buttons(gears.table.join(
    awful.button({}, 3, nil, function ()
        awful.spawn.with_shell(terminal .. " -e alsamixer")
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
    delay_show          = 2,
    mode                = "outside",
    preferred_positions = "top",
    timer_function = function()
        return "<span color=\"" .. beautiful.bg_focus .. "\">LMB</span> to toggle mute\n<span color=\"" .. beautiful.bg_focus .. "\">RMB</span> to open mixer\n<span color=\"" .. beautiful.bg_focus .. "\">Scroll up</span> to raise volume\n<span color=\"" .. beautiful.bg_focus .. "\">Scroll down</span> to lower volume"
    end,
}
