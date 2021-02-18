-- Theme based on the xresources theme

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

-- inherit default theme
local theme = dofile(themes_path.."default/theme.lua")
-- load vector assets' generators for this theme

theme.font          = "Hack 10"
theme.icon_font     = "Hack Nerd Font 10"
theme.taglist_font  = "Hack Nerd Font Mono 10"

theme.color0  = xrdb.color0  or "#282828"
theme.color1  = xrdb.color1  or "#cc241d"
theme.color2  = xrdb.color2  or "#98971a"
theme.color3  = xrdb.color3  or "#d79921"
theme.color4  = xrdb.color4  or "#458588"
theme.color5  = xrdb.color5  or "#b16286"
theme.color6  = xrdb.color6  or "#689d6a"
theme.color7  = xrdb.color7  or "#a89984"
theme.color8  = xrdb.color8  or "#928374"
theme.color9  = xrdb.color9  or "#fb4934"
theme.color10 = xrdb.color10 or "#b8bb26"
theme.color11 = xrdb.color11 or "#fabd2f"
theme.color12 = xrdb.color12 or "#83a598"
theme.color13 = xrdb.color13 or "#d3869b"
theme.color14 = xrdb.color14 or "#8ec07c"
theme.color15 = xrdb.color15 or "#ebdbb2"

theme.bg_normal     = theme.color0
theme.bg_focus      = theme.color10
theme.bg_urgent     = theme.color9
theme.bg_minimize   = theme.color2
theme.bg_systray    = theme.color15

theme.fg_normal     = theme.color15
theme.fg_focus      = theme.bg_normal
theme.fg_urgent     = theme.bg_normal
theme.fg_minimize   = theme.bg_normal

theme.useless_gap   = dpi(4)
theme.border_width  = dpi(2)
theme.border_normal = theme.bg_normal
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
theme.tooltip_border_color = theme.color8
theme.tooltip_border_width = theme.border_width

theme.taglist_bg_focus = theme.bg_focus
theme.taglist_bg_occupied = theme.bg_minimize
theme.taglist_fg_occupied = theme.bg_normal

theme.tasklist_disable_icon = true
theme.tasklist_bg_focus = theme.bg_normal
theme.tasklist_fg_focus = theme.fg_normal

theme.notification_icon_size = dpi(50)

theme.systray_icon_spacing = 2

theme.wibar_height = dpi(20)

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(16)
theme.menu_width  = dpi(100)

-- Recolor Layout icons:
theme = theme_assets.recolor_layout(theme, theme.bg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    20, theme.bg_focus, theme.bg_normal
)

local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Copy the wallpaper you want to ~/.cache/ as wall.png
theme.wallpaper = "~/.cache/wall.png"

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
