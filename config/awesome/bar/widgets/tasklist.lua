local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

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

awful.screen.connect_for_each_screen(function(s)
    s.myfocusedwindow = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.focused,
        buttons = tasklist_buttons
    }

   s.myminimizedlist = awful.widget.tasklist {
        screen   = s,
        filter   = awful.widget.tasklist.filter.minimizedcurrenttags,
        buttons  = tasklist_buttons,
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
end)
