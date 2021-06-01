local awful = require("awful")
local gfs = require("gears.filesystem")

local function run_once(cmd)
    local findme = cmd
    local firstspace = cmd:find(" ")
    if firstspace then findme = cmd:sub(0, firstspace - 1) end
    -- that function at the end is needed so it doesn"t throw a stupid error message
    awful.spawn.easy_async_with_shell(string.format("pgrep -u $USER -x %s > /dev/null || (%s)", findme, cmd), function() end)
end

run_once("xrdb -merge $HOME/.Xresources")
run_once("pulseaudio --start")
run_once("mpd")
run_once("redshift-gtk")
