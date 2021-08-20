local present, bufferline = pcall(require, "bufferline")
if not present then
    return
end

local bg      = "#002b36"
local bg2     = "#073642"
local bg3     = "#586e75"
local fg      = "#839496"
local accent  = "#268bd2"
local accent2 = "#859900"
local accent3 = "#dc322f"

require("bufferline").setup{
    options = {
        numbers = "none",
        mappings = true,
        separator_style = "thin",
        always_show_bufferline = false,
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        enforce_regular_tabs = false,
        sort_by = "directory",
        offsets = {
            {
                filetype = "NvimTree",
                text = "Explorer"
            }
        },
    },
    highlights = {
        fill = {
            guibg = bg
        },
        background = {
            guibg = bg
        },

        -- buffer
        buffer_selected = {
            guifg = fg,
            guibg = bg2,
            gui = "bold"
        },
        separator = {
            guifg = bg3,
            guibg = bg
        },
        separator_selected = {
            guifg = bg3,
            guibg = bg2
        },
        separator_visible = {
            guifg = bg2,
            guibg = bg2
        },
        indicator_selected = {
            guifg = accent,
            guibg = bg2
        },

        -- tabs over right
        tab = {
            guifg = fg,
            guibg = bg
        },
        tab_selected = {
            guifg = accent,
            guibg = bg2
        },
        tab_close = {
            guifg = accent,
            guibg = bg2
        },
        modified_selected = {
            guifg = accent2,
            guibg = bg2
        },
        modified = {
            guifg = accent3,
            guibg = bg
        },
        modified_visible = {
            guifg = accent,
            guibg = bg
        }
    }
}
