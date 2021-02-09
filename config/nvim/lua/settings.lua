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

-- Enable lazy redrawing
vim.api.nvim_set_option('lazyredraw', true)

-- Disable swap files
vim.api.nvim_set_option('swapfile', false)

-- Set dark background
vim.api.nvim_set_option('background', 'dark')

-- Set colorscheme
vim.cmd("colorscheme gruvbox8")

-- More colors
vim.api.nvim_set_option('termguicolors', true)

-- Don't show that --INSERT-- etc.
vim.api.nvim_set_option('showmode', false)

-- Remove those ~'s at the end of buffers
vim.api.nvim_set_option('fcs', "eob: ")
