local g = vim.g
local cmd = vim.cmd

local colors = require("colors")

g.neosolarized_bold = 1
g.neosolarized_underline = 1
g.neosolarized_italic = 1
g.neosolarized_termBoldAsBright = 0
cmd("colorscheme NeoSolarized")

local function fg(group, color)
    cmd("hi " .. group .. " guifg=" .. color)
end

local function bg(group, color)
    cmd("hi " .. group .. " guibg=" .. color)
end

local function fg_bg(group, fgcol, bgcol)
    cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

cmd("hi! link LineNr Normal")
fg_bg("StatusLineMode", colors.bg, colors.green)
fg("IndentBlankLineChar", colors.bg3)
