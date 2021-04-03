local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
require("decorations.widgets")

-- Function to wrap margins around widgets
local function wrap_margin(widget, l, r, t, b)
    return wibox.widget {
        widget,
        left = l,
        right = r,
        top = t,
        bottom = b,
        widget = wibox.container.margin,
    }
end

-- Function to add backgrounds to widgets
local function wrap_bg(widget, bg_color)
    return wibox.widget {
        widget,
        bg = bg_color,
        shape = gears.shape.rectangle,
        widget = wibox.container.background
    }
end

-- Function to make some widget have a forced size
function wrap_constraint(widget, w)
    return wibox.widget {
        widget,
        width = w,
        widget = wibox.container.constraint
    }
end

screen.connect_signal("request::desktop_decoration", function(s)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "bottom", screen = s })

    -- Add widgets to the wibox
    s.mywibox.widget = {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
        },
        { -- Middle widgets
            layout = wibox.layout.fixed.horizontal,
            wrap_margin(wrap_constraint(s.myminimizedlist, dpi(650)), dpi(6), dpi(6)),
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wrap_bg(wrap_margin(myvol, dpi(6), dpi(6)), beautiful.color6),
            wrap_bg(wrap_margin(mybat, dpi(6), dpi(6)), beautiful.color6),
            wrap_bg(wrap_margin(mytextclock, dpi(6), dpi(6)), beautiful.color6),
            wibox.widget.systray(),
            wrap_margin(s.mylayoutbox, dpi(6), 0, dpi(1), dpi(1)),
            mylauncher
        },
    }
end)
