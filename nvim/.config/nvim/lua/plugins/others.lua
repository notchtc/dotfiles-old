local M = {}

M.colorizer = function()
    local present, colorizer = pcall(require, "colorizer")
    if present then
        colorizer.setup()
        vim.cmd "ColorizerReloadAllBuffers"
    end
end

M.blankline = function()
    -- List of characters to be used as an indent line for each indentation level
    vim.g.indent_blankline_char_list = {"│", "┆", "┊", ""}
    -- Don't display indentation in the first column
    vim.g.indent_blankline_show_first_indent_level = false
    -- Don't display the full fold text
    vim.g.indent_blankline_show_foldtext = false
    vim.g.indent_blankline_filetype_exclude = {"txt", "packer", "help"}
end

return M
