-- Use system clipboard
vim.api.nvim_set_option('clipboard', 'unnamedplus')

-- Fancy line numbers
vim.api.nvim_win_set_option(0, 'number', true)
vim.api.nvim_win_set_option(0, 'relativenumber', true)

-- Imagine being case sensitive
vim.api.nvim_set_option('ignorecase', true)
-- Be case sensitive when pattern is uppercase
vim.api.nvim_set_option('smartcase', true)

-- Better splitting
vim.api.nvim_set_option('splitright', true)
vim.api.nvim_set_option('splitbelow', true)

-- Add a cursor line
vim.api.nvim_win_set_option(0, 'cursorline', true)

-- Spaces > tabs
vim.api.nvim_set_option('expandtab', true)
vim.api.nvim_set_option('tabstop', 4)
vim.api.nvim_set_option('softtabstop', 4)
vim.api.nvim_set_option('shiftwidth', 4)
vim.api.nvim_buf_set_option(0, 'expandtab', true)
vim.api.nvim_buf_set_option(0, 'tabstop', 4)
vim.api.nvim_buf_set_option(0, 'softtabstop', 4)
vim.api.nvim_buf_set_option(0, 'shiftwidth', 4)

-- Show trailing spaces
vim.api.nvim_win_set_option(0, 'list', true)
vim.api.nvim_set_option('listchars', 'trail:·')

-- Folding based on syntax
vim.api.nvim_win_set_option(0, 'foldmethod', 'syntax')
-- Set maximum fold nesting
vim.api.nvim_win_set_option(0, 'foldnestmax', 1)

-- Be able to see vim keybindings in awesome when using an alias
vim.api.nvim_set_option('title', true)

-- Set colorscheme
vim.cmd("colorscheme gruvbox")

-- More colors
vim.api.nvim_set_option('termguicolors', true)

-- Set dark background
vim.api.nvim_set_option('background', 'dark')

-- Don't show that --INSERT-- etc.
vim.api.nvim_set_option('showmode', false)

-- Remove those ~'s at the end of buffers
vim.api.nvim_set_option('fcs', "eob: ")

-- Make background the same as terminal (useful when adding transparency)
vim.cmd("hi Normal ctermbg=NONE guibg=NONE")
