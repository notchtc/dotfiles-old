local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
require("decorations.bar.widgets")

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

screen.connect_signal("request::desktop_decoration", function(s)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "bottom", screen = s })

    -- Add widgets to the wibox
    s.mywibox.widget = {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox
        },
        { -- Middle widgets
            layout = wibox.layout.fixed.horizontal,
            wrap_margin(s.myfocusedwindow, dpi(6), dpi(3)),
            wrap_margin(s.myminimizedlist, dpi(3), dpi(6)),
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wrap_bg(myvol, beautiful.color6),
            wrap_bg(mybat, beautiful.color6),
            wrap_bg(mytextclock, beautiful.color6),
            wibox.widget.systray(),
            wrap_margin(s.mylayoutbox, dpi(6), dpi(3), dpi(1), dpi(1)),
            wrap_margin(mylauncher, nil, dpi(3), dpi(2), dpi(2))
        },
    }
end)
