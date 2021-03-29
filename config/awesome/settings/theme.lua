local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local config_path = gfs.get_configuration_dir()

-- inherit default theme
local theme = dofile(themes_path.."default/theme.lua")
-- load vector assets' generators for this theme

theme.font         = "Hack 10"
theme.icon_font    = "Hack Nerd Font 10"
theme.taglist_font = "Hack Nerd Font Mono 11"

theme.background = xrdb.background or "#2f383e"
theme.foreground = xrdb.foreground or "#d3c6aa"
theme.color0  = xrdb.color0  or "#4b565c"
theme.color1  = xrdb.color1  or "#e67e80"
theme.color2  = xrdb.color2  or "#a7c080"
theme.color3  = xrdb.color3  or "#dbbc7f"
theme.color4  = xrdb.color4  or "#7fbbb3"
theme.color5  = xrdb.color5  or "#d3a0bc"
theme.color6  = xrdb.color6  or "#83c092"
theme.color7  = xrdb.color7  or "#d3c6aa"
theme.color8  = xrdb.color8  or "#4b565c"
theme.color9  = xrdb.color9  or "#e67e80"
theme.color10 = xrdb.color10 or "#a7c080"
theme.color11 = xrdb.color11 or "#dbbc7f"
theme.color12 = xrdb.color12 or "#7fbbb3"
theme.color13 = xrdb.color13 or "#d3a0bc"
theme.color14 = xrdb.color14 or "#83c092"
theme.color15 = xrdb.color15 or "#d3c6aa"

theme.bg_normal     = theme.background
theme.bg_focus      = theme.color2
theme.bg_urgent     = theme.color1
theme.bg_minimize   = theme.color0
theme.bg_systray    = theme.color6

theme.fg_normal     = xrdb.foreground
theme.fg_focus      = theme.bg_normal
theme.fg_urgent     = theme.bg_normal
theme.fg_minimize   = theme.bg_normal

theme.useless_gap   = nil
theme.border_width  = dpi(2)
theme.border_color_normal = theme.bg_normal
theme.border_color_active = theme.bg_focus
theme.border_color_marked = theme.color14

theme.tooltip_fg = theme.fg_normal
theme.tooltip_bg = theme.bg_normal
theme.tooltip_border_color = theme.bg_minimize
theme.tooltip_border_width = dpi(1)

theme.taglist_bg_focus = theme.bg_focus
theme.taglist_bg_occupied = theme.bg_normal
theme.taglist_fg_occupied = theme.fg_normal
theme.taglist_fg_empty = theme.bg_minimize

theme.tasklist_disable_icon = true
theme.tasklist_bg_focus = theme.bg_normal
theme.tasklist_fg_focus = theme.fg_normal
theme.tasklist_bg_minimize = theme.bg_normal
theme.tasklist_fg_minimize = theme.color0

theme.notification_icon_size = dpi(65)
theme.notification_margin = dpi(6)

theme.systray_icon_spacing = 2

theme.hotkeys_modifiers_fg = theme.bg_focus
theme.hotkeys_border_color = theme.bg_minimize
theme.hotkeys_group_margin = dpi(10)
theme.hotkeys_border_width = dpi(1)

theme.wibar_height = dpi(20)

theme.menu_submenu_icon = config_path.."images/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)
theme.menu_border_width = dpi(1)
theme.menu_border_color = theme.bg_minimize

-- Recolor Layout icons:
theme = theme_assets.recolor_layout(theme, theme.color6)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Set Awesome icon
theme.awesome_icon = config_path.."images/icon.png"

-- Generate taglist squares:
theme.taglist_squares_sel = nil
theme.taglist_squares_unsel = nil

theme.wallpaper = config_path.."images/wall.png"

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
