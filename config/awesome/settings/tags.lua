local awful = require("awful")

screen.connect_signal("request::desktop_decoration", function(s)
    awful.tag.add("", {
        layout   = awful.layout.suit.tile.right,
        gap      = 0,
        selected = true,
        screen   = s
    })

    awful.tag.add("", {
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

    awful.tag.add("ﱡ", {
        layout            = awful.layout.suit.tile.right,
        gap_sincle_client = false,
        screen            = s
    })

    awful.tag.add("ﱡ", {
        layout = awful.layout.floating,
        screen = s
    })
end)
