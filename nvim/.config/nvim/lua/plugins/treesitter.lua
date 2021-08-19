local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

local M = {}

M.treesitter = function()
    ts_config.setup {
        -- Ensure parsers are installed for these languages
        ensure_installed = {'lua', 'css', 'html'},
        -- Don't install the parser for C
        ignore_install = {'c'},
        -- Enable highlighting
        highlight = {
            enable = true
        },
        -- Enable indentation
        indent = {
            enable = true
        }
    }
end

M.rainbow = function()
    ts_config.setup {
        rainbow = {
            -- Enable rainbow parentheses
            enable = true,
            -- Highlight also non-parentheses delimiters
            extended_mode = true,
            -- Do not enable for files with more than 5000 lines
            max_file_lines = 5000
        }
    }
end

return M
