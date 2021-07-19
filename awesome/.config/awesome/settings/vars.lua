local gears = require("gears")
local beautiful = require("beautiful")

-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_configuration_dir() .. "settings/theme.lua")

-- This is used later as the default terminal, editor, browser, rss reader and music player to run
terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
browser = os.getenv("BROWSER") or "firefox"
rss = "newsboat"
music = "ncmpcpp"
screenshot = "maim"
launcher = "rofi -show run"

modkey = "Mod4"
