-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

local beautiful = require("beautiful")
local naughty = require("naughty")

require("settings")
require("autostart")
require("decorations")

naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title   = "Oops!",
        message = "An error happened"..(startup and " during startup: " or ": ") .. message
    }
end)

collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
collectgarbage("step", 1024)