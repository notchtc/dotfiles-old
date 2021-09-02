local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
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
    map("", "<up>", "", opt)
    map("", "<down>", "", opt)
    map("", "<left>", "", opt)
    map("", "<right>", "", opt)

    -- Make navigating through splits easier
    map("", "<C-h>", "<C-w>h", opt)
    map("", "<C-j>", "<C-w>j", opt)
    map("", "<C-k>", "<C-w>k", opt)
    map("", "<C-l>", "<C-w>l", opt)

    -- Make creating splits easier
    map("", "<leader>sv", "<CMD>split<CR>", opt)
    map("", "<leader>sh", "<CMD>vsplit<CR>", opt)

    -- Go through wrapped lines
    map("", "j", "gj", opt)
    map("", "k", "gk", opt)

    -- Spell Check
    map("n", "<leader>sp", "<CMD>setlocal spell! spelllang=en_us<CR>", opt)

    -- Disable search highlighting
    map("n", "<Esc>", "<CMD>noh<CR>", opt)

    -- Packer commands till because we are not loading it at startup
    cmd "silent! command PackerCompile lua require 'pluginList' require('packer').compile()"
    cmd "silent! command PackerInstall lua require 'pluginList' require('packer').install()"
    cmd "silent! command PackerStatus lua require 'pluginList' require('packer').status()"
    cmd "silent! command PackerSync lua require 'pluginList' require('packer').sync()"
    cmd "silent! command PackerUpdate lua require 'pluginList' require('packer').update()"
end

M.bufferline = function()
    -- Go to next/previous tab
    map("n", "<M-.>", "<CMD>BufferLineCycleNext<CR>", opt)
    map("n", "<M-,>", "<CMD>BufferLineCyclePrev<CR>", opt)

    -- Close tab
    map("n", "<M-c>", "<CMD>bdelete<CR>", opt)

    -- Go to nth visible buffer
    map("n", "<M-1>", "<CMD>BufferLineGoToBuffer 1<CR>", opt)
    map("n", "<M-2>", "<CMD>BufferLineGoToBuffer 2<CR>", opt)
    map("n", "<M-3>", "<CMD>BufferLineGoToBuffer 3<CR>", opt)
    map("n", "<M-4>", "<CMD>BufferLineGoToBuffer 4<CR>", opt)
    map("n", "<M-5>", "<CMD>BufferLineGoToBuffer 5<CR>", opt)
    map("n", "<M-6>", "<CMD>BufferLineGoToBuffer 6<CR>", opt)
    map("n", "<M-7>", "<CMD>BufferLineGoToBuffer 7<CR>", opt)
    map("n", "<M-8>", "<CMD>BufferLineGoToBuffer 8<CR>", opt)
    map("n", "<M-9>", "<CMD>BufferLineGoToBuffer 9<CR>", opt)
end

M.nvimtree = function()
    -- Toggle visibility of nvim-tree
    map("n", "<leader>n", "<CMD>NvimTreeToggle<CR>", opt)
    -- Focus nvim-tree
    map("n", "<leader>N", "<CMD>NvimTreeFocus<CR>", opt)
    -- Refresh nvim-tree
    map("n", "<leader>r", "<CMD>NvimTreeRefresh<CR>", opt)
end

M.colorizer = function()
    -- Enable colorizer in current buffer
    map("n", "<leader>ca", "<CMD>ColorizerAttachToBuffer<CR>", opt)
    -- Disable colorizer in current buffer
    map("n", "<leader>cd", "<CMD>ColorizerDetachFromBuffer<CR>", opt)
end

return M
