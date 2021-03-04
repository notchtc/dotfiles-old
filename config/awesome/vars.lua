local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")

-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme.lua")

-- Change colors of critical notifications
naughty.config.presets.critical.border_color = beautiful.bg_urgent
naughty.config.presets.critical.bg = beautiful.bg_normal
naughty.config.presets.critical.timeout = 60

-- Make notifications appear in the bottom left
naughty.config.defaults.position = "bottom_left"

-- This is used later as the default terminal, editor, browser, rss reader and music player to run
terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
browser = os.getenv("BROWSER") or "firefox"
rss = "newsboat"
music = "ncmpcpp"

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile.right,
    awful.layout.suit.floating,
}
