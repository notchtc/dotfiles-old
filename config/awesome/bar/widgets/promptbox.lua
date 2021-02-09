local awful = require("awful")

awful.screen.connect_for_each_screen(function(s)
    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
end)
