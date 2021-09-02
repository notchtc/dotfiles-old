local present, gitsigns = pcall(require, "gitsigns")
if not present then
    return
end

require("gitsigns").setup {
    -- Set characters used by gitsigns.nvim
    signs = {
        add = { hl = "DiffAdd", text = "│" },
        change = { hl = "DiffChange", text = "│" },
        delete = { hl = "DiffDelete", text = "╵" },
        topdelete = { hl = "DiffDelete", text = "╷" },
        changedelete = { hl = "DiffChange", text = "╰" },
    },
    watch_index = {
        interval = 100,
    },
}
