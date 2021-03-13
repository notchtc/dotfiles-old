-- Theme based on the xresources theme

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources") local dpi = xresources.apply_dpi local xrdb = xresources.get_current_theme()
local gears = require("gears")
local themes_path = gears.filesystem.get_themes_dir()
local config_path = gears.filesystem.get_configuration_dir()

-- inherit default theme
local theme = dofile(themes_path.."default/theme.lua")
-- load vector assets' generators for this theme

theme.font          = "Hack 10"
theme.icon_font     = "Hack Nerd Font 10"
theme.taglist_font  = "Hack Nerd Font Mono 10"

theme.background = xrdb.background or "#323d43"
theme.foreground = xrdb.foreground or "#d8caac"
theme.color0  = xrdb.color0  or "#868d80"
theme.color1  = xrdb.color1  or "#e68183"
theme.color2  = xrdb.color2  or "#a7c080"
theme.color3  = xrdb.color3  or "#d9bb80"
theme.color4  = xrdb.color4  or "#89beba"
theme.color5  = xrdb.color5  or "#d3a0bc"
theme.color6  = xrdb.color6  or "#87c095"
theme.color7  = xrdb.color7  or "#d8caac"
theme.color8  = xrdb.color8  or "#868d80"
theme.color9  = xrdb.color9  or "#e68183"
theme.color10 = xrdb.color10 or "#a7c080"
theme.color11 = xrdb.color11 or "#d9bb80"
theme.color12 = xrdb.color12 or "#89beba"
theme.color13 = xrdb.color13 or "#d3a0bc"
theme.color14 = xrdb.color14 or "#87c095"
theme.color15 = xrdb.color15 or "#d8caac"

theme.bg_normal     = theme.background
theme.bg_focus      = theme.color2
theme.bg_urgent     = theme.color1
theme.bg_minimize   = theme.color0
theme.bg_systray    = theme.color6

theme.fg_normal     = theme.foreground
theme.fg_focus      = theme.bg_normal
theme.fg_urgent     = theme.bg_normal
theme.fg_minimize   = theme.bg_normal

theme.useless_gap   = dpi(4)
theme.border_width  = dpi(2)
theme.border_normal = theme.color0
theme.border_focus  = theme.bg_focus
theme.border_marked = theme.color14

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

theme.tooltip_fg = theme.fg_normal
theme.tooltip_bg = theme.bg_normal
theme.tooltip_border_color = theme.color6
theme.tooltip_border_width = dpi(1)

theme.taglist_bg_focus = theme.bg_focus
theme.taglist_bg_occupied = theme.bg_minimize
theme.taglist_fg_occupied = theme.bg_normal

theme.tasklist_disable_icon = true
theme.tasklist_bg_focus = theme.bg_normal
theme.tasklist_fg_focus = theme.fg_normal
theme.tasklist_bg_minimize = theme.bg_normal
theme.tasklist_fg_minimize = theme.color0

theme.notification_icon_size = dpi(50)
theme.notification_margin = 0

theme.systray_icon_spacing = 2

theme.hotkeys_border_color = theme.color6
theme.hotkeys_group_margin = dpi(10)

theme.wibar_height = dpi(20)

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = config_path.."submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)
theme.menu_border_width = dpi(1)
theme.menu_border_color = theme.color6

-- Recolor Layout icons:
theme = theme_assets.recolor_layout(theme, theme.color6)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Set Awesome Icon
theme.awesome_icon = config_path.."icon.png"

local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Copy the wallpaper you want to ~/.cache/ as wall.png
theme.wallpaper = "~/.cache/wall.png"

return theme
