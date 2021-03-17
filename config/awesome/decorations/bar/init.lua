local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
require("decorations.bar.widgets")

-- Function to wrap margins around widgets
function widget_margin(widget, l, r, t, b)
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
function widget_bg(widget, bg_color)
    return wibox.widget {
        widget,
        bg = bg_color,
        shape = gears.shape.rectangle,
        widget = wibox.container.background
    }
end

-- Function to make some widget have a forced size
function widget_constraint(widget, w)
    return wibox.widget {
        widget,
        width = w,
        widget = wibox.container.constraint
    }
end

screen.connect_signal("request::desktop_decoration", function(s)

    awful.tag.add("", {
        layout   = awful.layout.suit.tile.right,
        gap      = 0,
        selected = true,
        screen   = s
    })

    awful.tag.add("", {
        layout            = awful.layout.suit.tile.right,
        gap_single_client = false,
        screen            = s
    })

    awful.tag.add("", {
        layout = awful.layout.floating,
        screen = s
    })

    awful.tag.add("", {
        layout            = awful.layout.suit.tile.right,
        gap_single_client = false,
        screen            = s
    })

    awful.tag.add("5", {
        layout            = awful.layout.suit.tile.right,
        gap_sincle_client = false,
        screen            = s
    })

    awful.tag.add("6", {
        layout = awful.layout.floating,
        screen = s
    })

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
            widget_margin(widget_constraint(s.myfocusedwindow, dpi(500)), dpi(6), dpi(3)),
            widget_margin(widget_constraint(s.myminimizedlist, dpi(450)), dpi(3), dpi(6)),
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            widget_bg(widget_margin(myvol, 6, 6), beautiful.color6),
            widget_bg(widget_margin(mybat, 6, 6), beautiful.color6),
            widget_bg(widget_margin(mytextclock, 6, 6), beautiful.color6),
            wibox.widget.systray(),
            widget_margin(s.mylayoutbox, 6, 0, 1, 1),
            mylauncher
        },
    }
end)
