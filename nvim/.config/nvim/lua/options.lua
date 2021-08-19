local opt = vim.opt

-- Use system clipboard
opt.clipboard = "unnamedplus"

-- Enable termguicolors
opt.termguicolors = true

-- Fancy line numbers
opt.number = true
opt.relativenumber = true

-- Imagine being case sensitive
opt.ignorecase = true
-- Be case sensitive when pattern is uppercase
opt.smartcase = true

-- Better splitting
opt.splitright = true
opt.splitbelow = true

-- Add a cursor line
opt.cursorline = true

-- Spaces > tabs
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

-- Show trailing spaces
opt.list = true
opt.listchars = "trail:·"

-- Folding based on expression
opt.foldmethod = "expr"
opt.foldexpr= "nvim_treesitter#foldexpr()"
-- Set maximum fold nesting
opt.foldnestmax = 1

-- Enable lazy redrawing
opt.lazyredraw = true

-- Disable swap files
opt.swapfile = false

-- Set dark background
opt.background = "dark"

-- Remove those ~'s at the end of buffers
opt.fcs = "eob: "

-- Always show statusline
opt.laststatus = 2

-- Don't show mode
opt.showmode = false

-- Mouse support
opt.mouse = "a"

-- Hack to remove cursorline staying on blank lines
opt.colorcolumn = "9999"

local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
