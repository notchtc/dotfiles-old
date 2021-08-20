local present, colorizer = pcall(require, "colorizer")
if not present then
    return
end

require "colorizer".setup {
    -- Attach to all filetypes
    "*";
    -- Exclude fern from highlighting
    "!fern";
    -- Exclude packer from highlighting
    "!packer";
}
