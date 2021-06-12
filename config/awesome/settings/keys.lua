local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
require("decorations.bar.widgets.volume")

-- General Awesome keys
awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers   = { modkey },
        key         = "s",
        group       = "awesome",
        description = "show help",
        on_press    = function() hotkeys_popup.show_help() end
    },
    awful.key {
        modifiers   = { modkey, "Control" },
        key         = "r",
        group       = "awesome",
        description = "reload awesome",
        on_press    = function() awesome.restart() end
    },
    awful.key {
        modifiers   = { modkey, "Shift" },
        key         = "q",
        group       = "awesome",
        description = "quit awesome",
        on_press    = function() awesome.quit() end
    },
    awful.key {
        modifiers   = { modkey },
        key         = "Return",
        group       = "launch",
        description = "open a terminal",
        on_press    = function() awful.spawn(terminal) end
    },
    awful.key {
        modifiers   = { modkey },
        key         = "r",
        group       = "launch",
        description = "run launcher",
        on_press    = function() awful.spawn(launcher) end
    }
})

-- Tags related keybindings
awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers = { modkey },
        key = "Left",
        group = "tag",
        description = "view previous",
        on_press = function() awful.tag.viewprev() end
    },
    awful.key {
        modifiers = { modkey },
        key = "Right",
        group = "tag",
        description = "view next",
        on_press = function() awful.tag.viewnext() end
    },
    awful.key {
        modifiers = { modkey },
        key = "Escape",
        group = "tag",
        description = "go back",
        on_press = function() awful.tag.history.restore() end
    }
})

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers = { modkey },
        key = "h",
        group = "client",
        description = "focus client on the left",
        on_press = function () awful.client.focus.bydirection("left") end
    },
    awful.key {
        modifiers = { modkey },
        key = "j",
        group = "client",
        description = "focus client at the bottom",
        on_press = function () awful.client.focus.bydirection("down") end
    },
    awful.key {
        modifiers = { modkey },
        key = "k",
        group = "client",
        description = "focus client at the top",
        on_press = function () awful.client.focus.bydirection("up") end
    },
    awful.key {
        modifiers = { modkey },
        key = "l",
        group = "client",
        description = "focus client on the right",
        on_press = function () awful.client.focus.bydirection("right") end
    },
    awful.key {
        modifiers = { modkey, "Shift" },
        key = "h",
        group = "client",
        description = "swap with client on the left",
        on_press = function() awful.client.swap.bydirection("left") end
    },
    awful.key {
        modifiers = { modkey, "Shift" },
        key = "j",
        group = "client",
        description = "swap with client on the bottom",
        on_press = function() awful.client.swap.bydirection("down") end
    },
    awful.key {
        modifiers = { modkey, "Shift" },
        key = "k",
        group = "client",
        description = "swap with client on the top",
        on_press = function() awful.client.swap.bydirection("up") end
    },
    awful.key {
        modifiers = { modkey, "Shift" },
        key = "l",
        group = "client",
        description = "swap with client on the right",
        on_press = function() awful.client.swap.bydirection("right") end
    },
    awful.key {
        modifiers = { modkey },
        key = "Tab",
        group = "client",
        description = "go back",
        on_press = function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end
    },
    awful.key {
        modifiers = { modkey, "Control" },
        key = "j",
        group = "screen",
        description = "focus the next screen",
        on_press = function () awful.screen.focus_relative( 1) end
    },
    awful.key {
        modifiers = { modkey, "Control" },
        key = "k",
        group = "screen",
        description = "focus the previous screen",
        on_press = function () awful.screen.focus_relative(-1) end
    },
    awful.key {
        modifiers = { modkey, "Control" },
        key = "n",
        group = "client",
        description = "restore minimized",
        on_press = function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:activate { raise = true, context = "key.unminimize" }
                  end
              end
    },
    awful.key {
        modifiers = { modkey },
        key = "u",
        group = "client",
        description = "jump to urgent client",
        on_press = function () awful.client.urgent.jumpto() end
    }
})

-- Layout related keybindings
awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers = { modkey, "Mod1" },
        key = "l",
        group = "layout",
        description = "increase master width factor",
        on_press = function () awful.tag.incmwfact( 0.05) end
    },
    awful.key {
        modifiers = { modkey, "Mod1"},
        key = "h",
        group = "layout",
        description = "decrease master width factor",
        on_press = function () awful.tag.incmwfact(-0.05) end
    },
    awful.key {
        modifiers = { modkey, "Control" },
        key = "h",
        group = "layout",
        description = "increase the number of master clients",
        on_press = function () awful.tag.incnmaster( 1, nil, true) end
    },
    awful.key {
        modifiers = { modkey, "Control" },
        key = "l",
        group = "layout",
        description = "decrease the number of master clients",
        on_press = function () awful.tag.incnmaster(-1, nil, true) end
    },
    awful.key {
        modifiers = { modkey, "Control" },
        key = "h",
        group = "layout",
        description = "increase the number of columns",
        on_press = function () awful.tag.incncol( 1, nil, true) end
    },
    awful.key {
        modifiers = { modkey, "Control" },
        key = "l",
        group = "layout",
        description = "decrease the number of columns",
        on_press = function () awful.tag.incncol(-1, nil, true) end
    },
    awful.key {
        modifiers = { modkey },
        key = "space",
        group = "layout",
        description = "select next",
        on_press = function () awful.layout.inc( 1) end
    },
    awful.key {
        modifiers = { modkey, "Shift" },
        key = "space",
        group = "layout",
        description = "select previous",
        on_press = function () awful.layout.inc(-1) end
    }
})

awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numrow",
        description = "only view tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end
    },
    awful.key {
        modifiers   = { modkey, "Control" },
        keygroup    = "numrow",
        description = "toggle tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end
    },
    awful.key {
        modifiers = { modkey, "Shift" },
        keygroup    = "numrow",
        description = "move focused client to tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end
    },
    awful.key {
        modifiers   = { modkey, "Control", "Shift" },
        keygroup    = "numrow",
        description = "toggle focused client on tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end
    },
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numpad",
        description = "select layout directly",
        group       = "layout",
        on_press    = function (index)
            local t = awful.screen.focused().selected_tag
            if t then
                t.layout = t.layouts[index] or t.layout
            end
        end
    }
})

-- Misc keybindings
awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers  = { },
        key         = "XF86AudioRaiseVolume",
        description = "raise volume",
        group       = "misc",
        on_press    = function()
            awful.spawn("pamixer -i 5")
            myvolTimer:emit_signal("timeout")
        end
    },
    awful.key {
        modifiers   = { },
        key         = "XF86AudioLowerVolume",
        description = "lower volume",
        group       = "misc",
        on_press    = function()
            awful.spawn("pamixer -d 5")
            myvolTimer:emit_signal("timeout")
        end
    },
    awful.key {
        modifiers   = { },
        key         = "XF86AudioMute",
        description = "toggle mute",
        group       = "misc",
        on_press    = function()
            awful.spawn("pamixer -t")
            myvolTimer:emit_signal("timeout")
        end
    },
    awful.key {
        modifiers   = { },
        key         = "XF86AudioPlay",
        description = "play/pause",
        group       = "misc",
        on_press    = function()
            awful.spawn("playerctl play-pause")
        end
    },
    awful.key {
        modifiers   = { },
        key         = "XF86AudioNext",
        description = "go to next track",
        group       = "misc",
        on_press    = function()
            awful.spawn("playerctl next")
        end
    },
    awful.key {
        modifiers   = { },
        key         = "XF86AudioPrev",
        description = "go to previous track",
        group       = "misc",
        on_press    = function()
            awful.spawn("playerctl previous")
        end
    },
    awful.key {
        modifiers   = { "Ctrl" },
        key         = "Print",
        description = "take screenshot and copy to clipboard",
        group       = "misc",
        on_press    = function()
            awful.spawn.with_shell(screenshot .. " -u | xclip -selection clipboard -t image/png")
        end
    },
    awful.key {
        modifiers   = { "Ctrl", "Shift" },
        key         = "Print",
        description = "take screenshot with selection and copy to clipboard",
        group       = "misc",
        on_press    = function()
            awful.spawn.with_shell(screenshot .. " -s -u | xclip -selection clipboard -t image/png")
        end
    },
    awful.key {
        modifiers   = { },
        key         = "Print",
        description = "take screenshot and upload to 0x0.st and copy link",
        group       = "misc",
        on_press    = function()
            awful.spawn.with_shell(screenshot .. " -u | curl -F 'file=@-' https://0x0.st | xclip -selection clipboard")
        end
    },
    awful.key {
        modifiers   = { "Shift" },
        key         = "Print",
        description = "take screenshot with selection and upload to 0x0.st and copy link",
        group       = "misc",
        on_press    = function()
            awful.spawn.with_shell(screenshot .. " -s -u | curl -F 'file=@-' https://0x0.st | xclip -selection clipboard")
        end
    },
    awful.key {
        modifiers   = { },
        key         = "XF86MonBrightnessDown",
        description = "lower brightness",
        group       = "misc",
        on_press    = function()
            awful.spawn("xbacklight -dec 5")
        end
    },
    awful.key {
        modifiers   = { },
        key         = "XF86MonBrightnessUp",
        description = "raise brightness",
        group       = "misc",
        on_press    = function()
            awful.spawn("xbacklight -inc 5")
        end
    },
    awful.key {
        modifiers   = { modkey, "Mod1" },
        key         = "m",
        description = "open music player",
        group       = "launch",
        on_press    = function()
            awful.spawn(music)
        end
    },
    awful.key {
        modifiers   = { modkey, "Mod1" },
        key         = "b",
        description = "open browser",
        group       = "launch",
        on_press    = function()
            awful.spawn(browser)
        end
    },
    awful.key {
        modifiers   = { modkey, "Mod1" },
        key         = "r",
        description = "open rss reader",
        group       = "launch",
        on_press    = function()
            awful.spawn(terminal .. " -t rss -e " .. rss)
        end
    }
})

client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button({ }, 1, function (c)
            c:activate { context = "mouse_click" }
        end),
        awful.button({ modkey }, 1, function (c)
            c:activate { context = "mouse_click", action = "mouse_move"  }
        end),
        awful.button({ modkey }, 3, function (c)
            c:activate { context = "mouse_click", action = "mouse_resize" }
        end),
    })
end)

client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
        awful.key {
            modifiers = { modkey },
            key = "f",
            group = "client",
            description = "toggle fullscreen",
            on_press = function (c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end
        },
        awful.key {
            modifiers = { modkey, "Shift" },
            key = "c",
            group = "client",
            description = "close",
            on_press = function (c) c:kill() end
        },
        awful.key {
            modifiers = { modkey, "Control" },
            key = "space",
            group = "client",
            description = "toggle floating",
            on_press = function () awful.client.floating.toggle() end
        },
        awful.key {
            modifiers = { modkey, "Control" },
            key = "Return",
            group = "client",
            description = "move to master",
            on_press = function (c) c:swap(awful.client.getmaster()) end
        },
        awful.key {
            modifiers = { modkey },
            key = "o",
            group = "client",
            description = "move to screen",
            on_press = function (c) c:move_to_screen() end
        },
        awful.key {
            modifiers = { modkey },
            key = "t",
            group = "client",
            description = "toggle keep on top",
            on_press = function (c) c.ontop = not c.ontop end
        },
        awful.key {
            modifiers = { modkey },
            key = "n",
            group = "client",
            description = "minimize",
            on_press = function (c)
                -- The client currently has the input focus, so it cannot be
                -- minimized, since minimized clients can"t have the focus.
                c.minimized = true
            end ,
        },
        awful.key {
            modifiers = { modkey },
            key = "m",
            group = "client",
            description = "(un)maximize",
            on_press = function (c)
                c.maximized = not c.maximized
                c:raise()
            end
        },
        awful.key {
            modifiers = { modkey, "Control" },
            key = "m",
            group = "client",
            description = "(un)maximize vertically",
            on_press = function (c)
                c.maximized_vertical = not c.maximized_vertical
                c:raise()
            end
        },
        awful.key {
            modifiers = { modkey, "Shift" },
            key = "m",
            group = "client",
            description = "(un)maximize horizontally",
            on_press = function (c)
                c.maximized_horizontal = not c.maximized_horizontal
                c:raise()
            end
        }
    })
end)
