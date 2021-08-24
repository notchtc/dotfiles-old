local modules = {
        "options",
        "utils",
        "mappings",
        "statusline"
}

for i = 1, #modules, 1 do
    pcall(require, modules[i])
end

require("mappings").misc()
