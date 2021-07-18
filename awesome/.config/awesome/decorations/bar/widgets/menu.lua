local awful = require("awful")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
require("settings.vars")

-- Create a main menu
local myawesomemenu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "manual", terminal .. " -e man awesome" },
    { "edit config", editor_cmd .. " " .. awesome.conffile },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
}

local mysystemmenu = {
    { "poweroff", function () awful.spawn.with_shell("ask 'Do you want to shutdown?' 'doas /sbin/poweroff'") end },
    { "reboot", function () awful.spawn.with_shell("ask 'Do you want to reboot?' 'doas /sbin/reboot'") end }
}

local mymainmenu = awful.menu({
    items = {
        { "awesome", myawesomemenu },
        { "system", mysystemmenu },
        { "open terminal", terminal }
    }
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })
