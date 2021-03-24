local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = {
        awful.button({ }, 1, function()
            c:activate { context = "titlebar", action = "mouse_move"  }
        end),
        awful.button({ }, 3, function()
            c:activate { context = "titlebar", action = "mouse_resize"}
        end),
    }

    awful.titlebar(c, {size = "18"}).widget = {
        { -- Left
            awful.titlebar.widget.titlewidget(c),
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Middle
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Right
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        layout = wibox.layout.align.horizontal
    }

    client.connect_signal("property::floating", function(c)
        local b = false;
        if c.first_tag ~= nil then
            b = c.first_tag.layout.name == "floating"
        end
        if c.floating or b then
            awful.titlebar.show(c)
            c.shape = gears.shape.rounded_rect
        else
            awful.titlebar.hide(c)
            c.shape = gears.shape.rectangle
        end
    end)

    client.connect_signal("manage", function(c)
        if c.floating or c.first_tag.layout.name == "floating" then
            awful.titlebar.show(c)
            c.shape = gears.shape.rounded_rect
        else
            awful.titlebar.hide(c)
            c.shape = gears.shape.rectangle
        end
    end)

    tag.connect_signal("property::layout", function(t)
        local clients = t:clients()
        for k,c in pairs(clients) do
            if c.floating or c.first_tag.layout.name == "floating" then
                awful.titlebar.show(c)
                c.shape = gears.shape.rounded_rect
            else
                awful.titlebar.hide(c)
                c.shape = gears.shape.rectangle
            end
        end
    end)
end)
