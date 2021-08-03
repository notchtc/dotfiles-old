local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")

-- Create the titlebar
client.connect_signal("request::titlebars", function(c)
    local buttons = {
        awful.button({ }, 1, function()
            c:activate { context = "titlebar", action = "mouse_move"  }
        end),
        awful.button({ }, 3, function()
            c:activate { context = "titlebar", action = "mouse_resize"}
        end),
    }

    awful.titlebar(c, { size = beautiful.titlebar_size }) : setup {
        nil,
        {
            align   = "center",
            buttons = buttons,
            widget  = awful.titlebar.widget.titlewidget(c)
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Show the titlebar only when the window is floating
client.connect_signal("property::floating", function(c)
    local b = false;
    if c.first_tag ~= nil then
        b = c.first_tag.layout.name == "floating"
    end
    if c.floating or b then
        c.border_width = 0
        awful.titlebar.show(c)

    else
        c.border_width = beautiful.border_width
        awful.titlebar.hide(c)
    end
end)

client.connect_signal("manage", function(c)
    if c.floating or c.first_tag.layout.name == "floating" then
        c.border_width = 0
        awful.titlebar.show(c)
    else
        c.border_with = beautiful.border_width
        awful.titlebar.hide(c)
    end
end)

tag.connect_signal("property::layout", function(t)
    local clients = t:clients()
    for k,c in pairs(clients) do
        if c.floating or c.first_tag.layout.name == "floating" then
            c.border_width = 0
            awful.titlebar.show(c)
        else
            c.border_width = beautiful.border_width
            awful.titlebar.hide(c)
        end
    end
end)
