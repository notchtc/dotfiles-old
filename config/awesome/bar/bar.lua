local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local vicious = require("vicious")

require("bar/menu")

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

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

-- Create a textclock widget
mytextclock = wibox.widget.textclock("<span font=\"" .. beautiful.icon_font .. "\" color=\"" .. beautiful.bg_normal .. "\">  %d.%m.%Y %H:%M </span>", 7)

-- Create battery widget
mybat = wibox.widget.textbox()
vicious.register(mybat, vicious.widgets.bat, "<span font=\"" .. beautiful.icon_font .. "\" color=\"" .. beautiful.bg_normal .. "\"> $1 $2% </span>", 36, "BAT1")

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
    objects        = { myvol },
    delay_show     = 2,
    mode = "outside",
    preferred_positions = "top",
    timer_function = function()
        return "<span color=\"" .. beautiful.bg_focus .. "\">LMB</span> to toggle mute\n<span color=\"" .. beautiful.bg_focus .. "\">RMB</span> to open mixer\n<span color=\"" .. beautiful.bg_focus .. "\">Scroll up</span> to raise volume\n<span color=\"" .. beautiful.bg_focus .. "\">Scroll down</span> to lower volume"
    end,
}

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

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a taglist widget
    s.mytasklist = awful.widget.tasklist {
        screen   = s,
        filter   = awful.widget.tasklist.filter.minimizedcurrenttags,
        buttons  = tasklist_buttons,
        style    = {
            shape_border_width = 1,
            shape_border_color = beautiful.fg_normal,
            shape = gears.shape.rectangle
        },
        layout   = {
        spacing = 3,
        spacing_widget = {
            widget       = wibox.container.margin
        },
        layout  = wibox.layout.flex.horizontal
        },
        -- Notice that there is *NO* wibox.wibox prefix, it is a template,
        -- not a widget instance.
        widget_template = {
            {
                {
                    {
                        id     = "text_role",
                        widget = wibox.widget.textbox
                    },
                    layout = wibox.layout.fixed.horizontal
                },
                left = 5,
                right = 5,
                widget = wibox.container.margin
            },
            id     = "background_role",
            widget = wibox.container.background
        },
    }

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "bottom", screen = s, height = "20" })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            wrap_margin(s.mypromptbox, 5, 0),
        },
        wrap_margin(s.mytasklist, 5, 5),
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wrap_bg(myvol, beautiful.color6),
            wrap_bg(mybat, beautiful.color6),
            wrap_bg(mytextclock, beautiful.color6),
            wibox.widget.systray(),
            wrap_margin(s.mylayoutbox, 5, 0),
            mylauncher
        }
    }
end)
