local beautiful = require("beautiful")
require("awful.autofocus")

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)

-- Set border colors depending on focus state
client.connect_signal("focus", function(c) c.border_color = beautiful.border_color_active end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_color_normal end)

-- No borders if only one tiled client
screen.connect_signal("arrange", function(s)
    for _, c in pairs(s.clients) do
        if #s.tiled_clients == 1 and c.floating == false and c.first_tag.layout.name ~= "floating" then
            c.border_width = 0
        elseif #s.tiled_clients > 1 or c.first_tag.layout.name == "floating" then
            c.border_width = beautiful.border_width
        end
    end
end)
