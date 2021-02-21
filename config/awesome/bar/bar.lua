local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
require("bar/widgets")

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

-- Function to wrap margins around widgets
function widget_margin(widget, l, r)
  return wibox.widget {
    widget,
    left = l,
    right = r,
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

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

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
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            widget_margin(s.mypromptbox, 3, 0),
        },
        {
            layout = wibox.layout.fixed.horizontal,
            widget_margin(widget_constraint(s.myfocusedwindow, dpi(500)), 3, 3),
            widget_margin(widget_constraint(s.myminimizedlist, dpi(450)), 0, 0)
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            widget_bg(widget_margin(myvol, 6, 6), beautiful.color6),
            widget_bg(widget_margin(mybat, 6, 6), beautiful.color6),
            widget_bg(widget_margin(mytextclock, 6, 6), beautiful.color6),
            wibox.widget.systray(),
            widget_margin(s.mylayoutbox, 6, 0),
            mylauncher
        }
    }
end)
