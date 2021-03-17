-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

require("awful.autofocus")
local beautiful = require("beautiful")
local naughty = require("naughty")

require("settings")
require("decorations")
require("autostart")

--  ERROR HANDLING
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title   = "Oops!",
        message = "An error happened"..(startup and " during startup: " or ": ") .. message
    }
end)

-- SIGNALS
-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_color_active end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_color_normal end)

-- GARBAGE COLLECTION
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
collectgarbage("step", 1024)
