-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

local naughty = require("naughty")

require("autostart")
require("configuration")
require("ui")

-- ERROR HANDLING {{{
-- Check if awesome encountered an error during startup and fell back to another config (This code will only ever execute for the fallback config)
naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title   = "Oops!",
        message = "An error happened"..(startup and " during startup: " or ": ") .. message
    }
end)
-- }}}

-- GARBAGE COLLECTION {{{
-- Run garbage collection once in a while.
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
collectgarbage("step", 1024)
-- }}}

-- vim: set foldmethod=marker:
