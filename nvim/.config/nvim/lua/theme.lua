local g = vim.g
local cmd = vim.cmd

g.neosolarized_bold = 1
g.neosolarized_underline = 1
g.neosolarized_italic = 1
g.neosolarized_termBoldAsBright = 0
cmd('colorscheme NeoSolarized')
cmd('hi! link LineNr Normal')
cmd('hi StatusMode guibg=#859900 guifg=#002b36')
