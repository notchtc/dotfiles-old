local g = vim.g

-- Enable file highlight for git attributes
g.nvim_tree_git_hl = 1

-- Show git, folder and file icons
g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
}

-- Set git icons
g.nvim_tree_icons = {
    git = {
        deleted = "",
        ignored = "",
        renamed = "",
        staged = "",
        unmerged = "",
        unstaged = "",
        untracked = "",
    },
}

local present, nvimtree = pcall(require, "nvim-tree")
if not present then
    return
end

nvimtree.setup {
    -- Open the tree by default when opening (n)vim or (n)vim $DIR
    auto_open = false,
    -- Close the tree when it's the last window
    auto_close = true,
    -- Disable netrw
    disable_netrw = true,
    -- Prevent netrw from automatically opening when opening directories
    hijack_netrw = true,
    view = {
        allow_resize = true,
        side = "left",
        width = 25,
    },
}
