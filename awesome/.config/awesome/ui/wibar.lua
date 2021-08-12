local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
require("ui.widgets")

-- FUNCTIONS {{{
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
local function wrap_bg(widget, bg_color) return wibox.widget {
        widget,
        bg = bg_color,
        shape = gears.shape.rectangle,
        widget = wibox.container.background
    }
end

-- Function to limit the size of widgets
local function wrap_constraint(widget, w)
    return wibox.widget {
        widget,
        width = w,
        widget = wibox.container.constraint
    }
end
-- }}}

-- WIBAR {{{
screen.connect_signal("request::desktop_decoration", function(s)
    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, type = "dock" })

    -- Add widgets to the wibox
    s.mywibox:setup{
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox
        },
        { -- Middle widgets
            layout = wibox.layout.fixed.horizontal,
            wrap_margin(wrap_constraint(s.myfocusedwindow, dpi(435)), dpi(6), dpi(3)),
            wrap_margin(s.myminimizedlist, dpi(3), dpi(6)),
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            myvol,
            mybat,
            mytextclock,
            wrap_margin(wibox.widget.systray(), dpi(6)),
            wrap_margin(s.mylayoutbox, dpi(3), dpi(3), dpi(1), dpi(1))
        },
    }
end)
-- }}}

-- vim: set foldmethod=marker:
