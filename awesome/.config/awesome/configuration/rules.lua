local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")
local ruled = require("ruled")

-- CLIENTS {{{
-- Rules to apply to new clients.

ruled.client.connect_signal("request::rules", function()
    -- All clients will match this rule.
    ruled.client.append_rule {
        id         = "global",
        rule       = { },
        properties = {
            focus            = awful.client.focus.filter,
            raise            = true,
            border_color     = beautiful.border_color_normal,
            size_hints_honor = false,
            screen           = awful.screen.preferred,
            placement        = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    }

    -- Floating clients.
    ruled.client.append_rule {
        id       = "floating",
        rule_any = {
            instance = { "pinentry" },
            class    = {
                "Sxiv", "Steam", "KeePassXC", "Pavucontrol", "Gnome-calendar"
            },
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name    = {
                "Event Tester",  -- xev.
            },
            role    = {
                "pop-up",         -- e.g. Google Chrome"s (detached) Developer Tools.
            }
        },
        properties = { floating = true, placement = awful.placement.centered+awful.placement.no_offscreen }
    }

    -- Add titlebars to normal clients and dialogs
    ruled.client.append_rule {
        id         = "titlebars",
        rule_any   = { type = { "normal", "dialog" } },
        properties = { titlebars_enabled = true }
    }

    ruled.client.append_rule {
        rule_any = { class = { "KeePassXC", "Pavucontrol" } },
        properties = { ontop = true }
    }

    ruled.client.append_rule {
        rule_any = { class = { "Firefox", "LibreWolf", "Chromium-browser" } },
        properties = { tag = awful.screen.focused().tags[1] }
    }

    ruled.client.append_rule {
        rule = { class = "Alacritty" },
        properties = { tag = awful.screen.focused().tags[2] }
    }

    ruled.client.append_rule {
        rule_any = { class = { "Gimp", "kdenlive", "lmms" } },
        properties = { tag = awful.screen.focused().tags[3] }
    }

    ruled.client.append_rule {
        rule_any = { class = { "mpv" }, name = { "ncmpcpp", "rss" }  },
        properties = { tag = awful.screen.focused().tags[4] }
    }

    ruled.client.append_rule {
        rule = { class = "TelegramDesktop" },
        properties = { tag = awful.screen.focused().tags[5] }
    }

    ruled.client.append_rule {
        rule_any = { class = { "hl2_linux", "openmw", "openttd" } },
        properties = { fullscreen = true }
    }

    ruled.client.append_rule {
        rule = { class = "Gnome-calendar" },
        properties = {
            ontop = true,
            sticky = true,
            focusable = true,
            border_width = 0,
            titlebars_enabled = false
        }
    }
end)
-- }}}

-- NOTIFICATIONS {{{
ruled.notification.connect_signal("request::rules", function()
    -- All notifications will match this rule.
    ruled.notification.append_rule {
        rule       = { },
        properties = { screen = awful.screen.preferred }
    }
    ruled.notification.append_rule {
        rule       = { urgency = "low" },
        properties = { border_color = beautiful.color6, timeout = 5 }
    }
    ruled.notification.append_rule {
        rule       = { urgency = "normal" },
        properties = { border_color = beautiful.bg_focus, timeout = 20 }
    }
    ruled.notification.append_rule {
        rule       = { urgency = "critical" },
        properties = { bg = beautiful.bg_normal, border_color = beautiful.bg_urgent, timeout = 60 }
    }
end)

naughty.connect_signal("request::display", function(n) naughty.layout.box { notification = n } end)
-- }}}

-- vim: set foldmethod=marker:
