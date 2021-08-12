local gears = require("gears")
local beautiful = require("beautiful")

-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_configuration_dir() .. "configuration/theme.lua")

-- This is used later as the default terminal, editor, browser, rss reader and music player to run
terminal = "alacritty"
editor = os.getenv("EDITOR") or terminal .. " -e " .. "nvim"
editor_cmd = editor
browser = os.getenv("BROWSER") or "chromium"
rss = "newsboat"
music = "ncmpcpp"
screenshot = "maim"
launcher = "rofi -show run"

-- When set to true, titlebars will be enabled, when set to false, they won't
-- I have set this to false because I have some problems with I think titlebars that make awesomewm freeze
-- If you have a fix please let me know
titlebars = false

-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key, I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"
