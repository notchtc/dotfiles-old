local beautiful = require("beautiful")
local wibox = require("wibox")
local vicious = require("vicious")

mympd = wibox.widget.textbox()
vicious.register(mympd,
                 vicious.widgets.mpd,
                 function (widget, args)
                    if args["{state}"] == "Stop" then
                        return ''
                    else
                        return ("<span font=\"" .. beautiful.icon_font .. "\"> %s - %s</span>"):format(
                        args["{Artist}"], args["{Title}"])
                    end
                end, 11)
