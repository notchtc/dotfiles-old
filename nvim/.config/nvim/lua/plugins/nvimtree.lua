local present, tree_c = pcall(require, "nvim-tree.config")
if not present then
    return
end

local tree_cb = tree_c.nvim_tree_callback
local g = vim.g

-- Enable file highlight for git attributes
g.nvim_tree_git_hl = 1
-- Open the tree by default when opening (n)vim or (n)vim $DIR
g.nvim_tree_auto_open = 0
-- Close the tree when it's the last window
g.nvim_tree_auto_close = 1
-- Disable netrw
g.nvim_tree_disable_netrw = 1
-- Prevent netrw from automatically opening when opening directories
g.nvim_tree_hijack_netrw = 0
-- Show git, folder and file icons
g.nvim_tree_show_icons = {
    git = 1,
    folders = 0,
    files = 0,
}

-- Set git icons
g.nvim_tree_icons = {
    git = {
        unstaged = "",
        staged = "",
        renamed = "",
        untracked = "",
        deleted = "",
        ignored = "",
    }
}
