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

theme.font         = "Iosevka Aile 11"
theme.icon_font    = "Hack Nerd Font 11"
theme.taglist_font = "Hack Nerd Font Mono 11"

theme.background     = xrdb.background or "#2f383e"
theme.foreground     = xrdb.foreground or "#d3c6aa"
theme.color0         = xrdb.color0  or "#4b565c"
theme.color1         = xrdb.color1  or "#e67e80"
theme.color2         = xrdb.color2  or "#98971a"
theme.color3         = xrdb.color3  or "#a7c080"
theme.color4         = xrdb.color4  or "#7fbbb3"
theme.color5         = xrdb.color5  or "#d699b6"
theme.color6         = xrdb.color6  or "#83c092"
theme.color7         = xrdb.color7  or "#d3c6aa"
theme.color8         = xrdb.color8  or "#4b565c"
theme.color9         = xrdb.color9  or "#e67e80"
theme.color10        = xrdb.color10 or "#98971a"
theme.color11        = xrdb.color11 or "#a7c080"
theme.color12        = xrdb.color12 or "#7fbbb3"
theme.color13        = xrdb.color13 or "#d699b6"
theme.color14        = xrdb.color14 or "#83c092"
theme.color15        = xrdb.color15 or "#d3c6aa"

theme.bg_normal    = theme.background
theme.bg_focus     = theme.color10
theme.bg_urgent    = theme.color9
theme.bg_minimize  = theme.background
theme.bg_systray   = theme.background

theme.fg_normal    = theme.foreground
theme.fg_focus     = theme.bg_normal
theme.fg_urgent    = theme.bg_normal
theme.fg_minimize  = theme.color8

theme.useless_gap  = 0
theme.border_width = dpi(2)
theme.border_color_normal = theme.bg_normal
theme.border_color_active = theme.bg_focus
theme.border_color_marked = theme.color14

theme.tooltip_fg           = theme.fg_normal
theme.tooltip_bg           = theme.bg_normal
theme.tooltip_border_color = theme.bg_minimize
theme.tooltip_border_width = dpi(2)

theme.taglist_bg_focus    = theme.bg_focus
theme.taglist_bg_occupied = theme.bg_normal
theme.taglist_fg_occupied = theme.fg_normal
theme.taglist_fg_empty    = theme.fg_minimize

theme.tasklist_disable_icon = true
theme.tasklist_bg_focus     = theme.bg_normal
theme.tasklist_fg_focus     = theme.fg_normal
theme.tasklist_bg_minimize  = theme.bg_normal
theme.tasklist_fg_minimize  = theme.fg_minimize

theme.titlebar_size      = dpi(20)
theme.titlebar_bg_normal = theme.bg_normal
theme.titlebar_bg_focus  = theme.bg_focus

theme.notification_icon_size = dpi(85)
theme.notification_margin    = dpi(3)

theme.systray_icon_spacing = 3

theme.hotkeys_modifiers_fg     = theme.bg_focus
theme.hotkeys_border_color     = theme.bg_minimize
theme.hotkeys_group_margin     = dpi(6)
theme.hotkeys_border_width     = dpi(2)
theme.hotkeys_font             = "Iosevka 11"
theme.hotkeys_description_font = "Iosevka Aile 9"

theme.wibar_height = dpi(20)

theme.menu_height       = dpi(15)
theme.menu_width        = dpi(100)
theme.menu_border_width = dpi(2)
theme.menu_border_color = theme.bg_minimize

-- Recolor Layout icons:
theme = theme_assets.recolor_layout(theme, theme.color14)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Set Awesome icon
theme.awesome_icon = theme_assets.awesome_icon(theme.wibar_height, theme.color14, theme.background)

-- Yeet taglist squares:
theme.taglist_squares_sel         = nil
theme.taglist_squares_unsel       = nil
theme.taglist_squares_sel_empty   = nil
theme.taglist_squares_unsel_empty = nil

theme.wallpaper = config_path.."wall.png"

return theme
