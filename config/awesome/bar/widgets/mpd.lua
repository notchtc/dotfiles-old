local beautiful = require("beautiful")
local wibox = require("wibox")
local vicious = require("vicious")

mpd = wibox.widget.textbox()

mympd = wibox.widget {
    layout = wibox.container.scroll.horizontal,
    max_size = 350,
    step_function =  wibox.container.scroll.step_functions.linear_increase,
    speed = 50,
    {
        widget = mpd
    },
}

mympd:set_fps(20)

vicious.register(mpd,
                 vicious.widgets.mpd,
                 function (widget, args)
                    if args["{state}"] == "Stop" then
                        return ''
                    else
                        return ("<span font=\"" .. beautiful.icon_font .. "\"> %s  </span>"):format(
                        args["{Title}"])
                    end
                end, 11)
