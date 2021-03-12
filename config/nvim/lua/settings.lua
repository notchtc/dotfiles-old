-- Use system clipboard
vim.o.clipboard = 'unnamedplus'

-- Fancy line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Imaoine being case sensitive
vim.o.ignorecase = true
-- Be case sensitive when pattern is uppercase
vim.o.smartcase = true

-- Better splittino
vim.o.splitright = true
vim.o.splitbelow = true

-- Add a cursor line
vim.wo.cursorline = true

-- Spaces > tabs
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- Show trailing spaces
vim.wo.list = true
vim.o.listchars = 'trail:·'

-- Folding based on syntax
vim.wo.foldmethod = 'syntax'
-- Set maximum fold nesting
vim.wo.foldnestmax = 1

-- Enable lazy redrawing
vim.o.lazyredraw = true

-- Disable swap files
vim.o.swapfile = false

-- Set dark background
vim.o.background = 'dark'

-- Set colorscheme
vim.cmd('colorscheme forest-night')

-- More colors
vim.o.termguicolors = true

-- Remove those ~'s at the end of buffers
vim.o.fcs = 'eob: '
