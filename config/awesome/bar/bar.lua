local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

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
function wrap_margin(widget, l, r)
  return wibox.widget {
    widget,
    left = l,
    right = r,
    widget = wibox.container.margin,
  }
end

-- Function to add backgrounds to widgets
function wrap_bg(widget, bg_color)
  return wibox.widget {
    widget,
    bg = bg_color,
    shape = gears.shape.rectangle,
    widget = wibox.container.background
  }
end

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "", "", "", "", "", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "bottom", screen = s, height = "20" })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            wrap_margin(s.mypromptbox, 2, 5),
        },
        s.mytasklist,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wrap_margin(s.myminimizedlist, 2, 5),
            wrap_bg(myvol, beautiful.color6),
            wrap_bg(mybat, beautiful.color6),
            wrap_bg(mytextclock, beautiful.color6),
            wibox.widget.systray(),
            wrap_margin(s.mylayoutbox, 7, 0),
            mylauncher
        }
    }
end)
