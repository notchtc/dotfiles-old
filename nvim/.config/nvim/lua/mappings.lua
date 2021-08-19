local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local cmd = vim.cmd

local M = {}
local opt = {}

-- Set the leader key
vim.g.mapleader = " "

M.misc = function()
    -- Disable arrow keys for moving in normal mode
    map("", "<up>",    "", opt)
    map("", "<down>",  "", opt)
    map("", "<left>",  "", opt)
    map("", "<right>", "", opt)

    -- Make navigating through splits easier
    map("", "<C-h>", "<C-w>h", opt)
    map("", "<C-j>", "<C-w>j", opt)
    map("", "<C-k>", "<C-w>k", opt)
    map("", "<C-l>", "<C-w>l", opt)

    -- Make creating splits easier
    map("", "<leader>sv", ":split<CR>",  opt)
    map("", "<leader>sh", ":vsplit<CR>", opt)

    -- Go through wrapped lines
    map("", "j", "gj", opt)
    map("", "k", "gk", opt)

    -- Go to next/previous file
    map("n", "<leader>l", ":wn<CR>", opt)
    map("n", "<leader>h", ":wN<CR>", opt)

    -- Spell Check
    map("n", "<leader>sp", ":setlocal spell! spelllang=en_us<CR>", opt)

    -- Packer commands till because we are not loading it at startup
    cmd("silent! command PackerCompile lua require 'pluginList' require('packer').compile()")
    cmd("silent! command PackerInstall lua require 'pluginList' require('packer').install()")
    cmd("silent! command PackerStatus lua require 'pluginList' require('packer').status()")
    cmd("silent! command PackerSync lua require 'pluginList' require('packer').sync()")
    cmd("silent! command PackerUpdate lua require 'pluginList' require('packer').update()")
end

M.bufferline = function()
    -- Go to next/previous tab
    map("n", "<M-.>", ":BufferLineCycleNext<CR>", {silent = true})
    map("n", "<M-,>", ":BufferLineCyclePrev<CR>", {silent = true})

    -- Close tab
    map("n", "<M-c>", ":bdelete<CR>", {silent = true})
end

M.nvimtree = function()
    -- Toggle visibility of nvim-tree
    map("n", "<leader>n", ":NvimTreeToggle<CR>",   {silent = true})
    -- Go to the current file in nvim-tree
    map("n", "<leader>N", ":NvimTreeFindFile<CR>", {silent = true})
    -- Refresh nvim-tree
    map("n", "<leader>r", ":NvimTreeRefresh<CR>",  {silent = true})
end

return M
