local awful = require("awful")
local gears = require("gears")

local function run_once(cmd)
    local findme = cmd
    local firstspace = cmd:find(' ')
    if firstspace then findme = cmd:sub(0, firstspace - 1) end
    awful.spawn.easy_async_with_shell(string.format('sh -c "pgrep -u $USER -x %s > /dev/null || (%s)"', findme, cmd), {})
end

run_once("xrdb -merge $HOME/.Xresources")
run_once("pulseaudio --start")
run_once("mpd")
run_once("mpDris2")
run_once("redshift-gtk")
