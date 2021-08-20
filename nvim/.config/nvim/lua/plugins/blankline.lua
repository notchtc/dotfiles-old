local g = vim.g

-- List of characters to be used as an indent line for each indentation level
g.indent_blankline_char_list = {"│", "┆", "┊", ""}
-- Don't display indentation in the first column
g.indent_blankline_show_first_indent_level = false
-- Don't display the full fold text
g.indent_blankline_show_foldtext = false
g.indent_blankline_filetype_exclude = {"txt", "packer", "help"}
