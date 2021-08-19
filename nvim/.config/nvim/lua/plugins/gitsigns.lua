local present, gitsigns = pcall(require, "gitsigns")
if not present then
    return
end

require("gitsigns").setup {
    -- Set characters used by gitsigns.nvim
    signs = {
        add          = { text = "│" },
        change       = { text = "│" },
        delete       = { text = "╵" },
        topdelete    = { text = "╷" },
        changedelete = { text = "╰" }
    }
}
