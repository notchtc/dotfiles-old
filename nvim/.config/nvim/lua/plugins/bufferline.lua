local present, bufferline = pcall(require, "bufferline")
if not present then
    return
end

local colors = require("colors")

bufferline.setup{
    options = {
        numbers                 = "none",
        separator_style         = "thin",
        always_show_bufferline  = false,
        show_buffer_icons       = false,
        show_buffer_close_icons = false,
        show_close_icon         = false,
        left_trunc_marker       = "←",
        right_trunc_marker      = "→",
    },
    highlights = {
        fill = {
            guibg = colors.bg
        },
        background = {
            guibg = colors.bg
        },
        buffer_selected = {
            guifg = fg,
            guibg = colors.bg2,
            gui = "bold"
        },
        separator = {
            guifg = bg3,
            guibg = colors.bg
        },
        separator_selected = {
            guifg = bg3,
            guibg = colors.bg2
        },
        separator_visible = {
            guifg = bg2,
            guibg = colors.bg2
        },
        indicator_selected = {
            guifg = colors.blue,
            guibg = colors.bg2
        },
        tab = {
            guifg = fg,
            guibg = colors.bg
        },
        tab_selected = {
            guifg = colors.blue,
            guibg = colors.bg2
        },
        tab_close = {
            guifg = colors.blue,
            guibg = colors.bg2
        },
        modified_selected = {
            guifg = colors.green,
            guibg = colors.bg2
        },
        modified = {
            guifg = colors.red,
            guibg = colors.bg
        },
        modified_visible = {
            guifg = colors.blue,
            guibg = colors.bg
        },
        duplicate = {
            guibg = colors.bg
        },
        duplicate_selected = {
            guibg = colors.bg2
        }
    }
}
