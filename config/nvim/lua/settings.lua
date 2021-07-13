-- Use system clipboard
vim.o.clipboard = vim.o.clipboard .. 'unnamedplus'

-- Fancy line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Imaoine being case sensitive
vim.o.ignorecase = true
-- Be case sensitive when pattern is uppercase
vim.o.smartcase = true

-- Better splitting
vim.o.splitright = true
vim.o.splitbelow = true

-- Add a cursor line
vim.wo.cursorline = true

-- Spaces > tabs
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.bo.expandtab = true
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4

-- Show trailing spaces
vim.wo.list = true
vim.o.listchars = 'trail:·'

-- Folding based on expression
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr= 'nvim_treesitter#foldexpr()'
-- Set maximum fold nesting
vim.wo.foldnestmax = 1

-- Enable lazy redrawing
vim.o.lazyredraw = true

-- Disable swap files
vim.bo.swapfile = false

-- Set dark background
vim.o.background = 'dark'

-- More colors
vim.o.termguicolors = true

-- Remove those ~'s at the end of buffers
vim.o.fcs = 'eob: '

-- Always show statusline
vim.o.laststatus = 2

-- Don't show mode
vim.o.showmode = false

-- Mouse support
vim.o.mouse = vim.o.mouse .. 'a'

-- Hack to remove cursorline staying on blank lines
vim.wo.colorcolumn = '9999'
