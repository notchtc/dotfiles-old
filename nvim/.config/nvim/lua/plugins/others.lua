local M = {}

local g = vim.g

M.colorizer = function()
    local present, colorizer = pcall(require, "colorizer")
    if present then
        colorizer.setup()
        vim.cmd "ColorizerReloadAllBuffers"
    end
end

M.blankline = function()
    -- Enable
    g.indent_blankline_enabled = true
    -- Set character
    g.indent_blankline_char = "▏"
    -- Exclude some filetypes
    g.indent_blankline_filetype_exclude = { "txt", "packer", "help", "NvimTree" }
    -- Exclude some buffer types
    g.indent_blankline_buftype_exclude = { "terminal" }
    -- Don't show first indent level
    g.indent_blankline_show_first_indent_level = false
    -- Don't show foldtext
    g.indent_blankline_show_foldtext = false
end

return M
