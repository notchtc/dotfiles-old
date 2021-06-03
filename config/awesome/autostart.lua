local awful = require("awful")
local gfs = require("gears.filesystem")

local function run_once(cmd)
    local findme = cmd
    local firstspace = cmd:find(" ")
    if firstspace then findme = cmd:sub(0, firstspace - 1) end
    -- that function at the end is needed so it doesn't throw a stupid error message
    awful.spawn.easy_async_with_shell(string.format("pgrep -u $USER -x %s > /dev/null || (%s)", findme, cmd), function() end)
end

autostart_apps = {
    "xrdb -merge $HOME/.Xresources",
    "pulseaudio --start",
    "mpd",
    "redshift-gtk"
}

for app = 1, #autostart_apps do run_once(autostart_apps[app]) end
