local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

ts_config.setup {
    -- Ensure parsers are installed for these languages
    ensure_installed = { "lua", "css", "html" },
    -- Don't install the parser for C
    ignore_install = { "c" },
    -- Enable highlighting
    highlight = {
        enable = true,
    },
}
