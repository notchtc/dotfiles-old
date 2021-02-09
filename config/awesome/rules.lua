local awful = require("awful")
local beautiful = require("beautiful")

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen,
                     size_hints_honor = false
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
        },
        class = {
          "Sxiv",
          "KeePassXC",
          "OTPClient",
          "Steam"
        },
        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
          "GIMP Startup",
          "OTPClient"
        },
        role = {
          "pop-up"       -- e.g. Google Chrome's (detached) Developer Tools
        }
      }, properties = { floating = true }},

    { rule_any = { class = { "LibreWolf", "Firefox" }},
    properties = { tag = awful.screen.focused().tags[1] }},

    { rule = { class = "Alacritty" },
    properties = { tag = awful.screen.focused().tags[2] }},

    { rule_any = { class = { "Gimp", "kdenlive" } },
    properties = { tag = awful.screen.focused().tags[3], maximized = true }},

    { rule_any = { class = "mpv", name = { "music", "rss" }  },
    properties = { tag = awful.screen.focused().tags[4], switchtotag = true }},

    { rule = { class = "discord" },
    properties = { tag = awful.screen.focused().tags[5] }}
}
