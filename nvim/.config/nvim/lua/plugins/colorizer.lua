local present, colorizer = pcall(require, "colorizer")
if present then
    require "colorizer".setup {
        -- Attach to all filetypes
        "*";
        -- Exclude fern from highlighting
        "!fern";
        -- Exclude packer from highlighting
        "!packer";
    }
end
