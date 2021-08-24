local opt = vim.opt

-- Don't write to shadafile yet
opt.shadafile = "NONE"

-- Switch to a faster shell
opt.shell = "/bin/sh"

-- Make life better
opt.clipboard = "unnamedplus"
opt.mouse = "a"

-- Numbers
opt.number = true
opt.relativenumber = true

-- Only case sensitive when there are uppercase letters
opt.ignorecase = true
opt.smartcase = true

opt.splitright = true
opt.splitbelow = true

-- Spaces > tabs
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

-- Show trailing whitespace
opt.list = true
opt.listchars = "trail:·"

-- Folding with treesitter
opt.foldmethod = "expr"
opt.foldexpr= "nvim_treesitter#foldexpr()"
opt.foldnestmax = 1

-- Faster vim or something
opt.lazyredraw = true
opt.swapfile = false

-- Stuff to look cool
opt.termguicolors = true
opt.background = "dark"
opt.laststatus = 2
opt.showmode = false
opt.fillchars = { eob = " " }
opt.cursorline = true
-- Hack to remove cursorline staying on blank lines
opt.colorcolumn = "9999"

-- Disable nvim intro
opt.shortmess:append "casI"

-- Disable some built in plugins
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
