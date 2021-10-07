local g = vim.g
local cmd = vim.cmd

local colors = require "colors"

cmd "colorscheme solarized"

local function fg(group, color)
    cmd("hi " .. group .. " guifg=" .. color)
end

local function bg(group, color)
    cmd("hi " .. group .. " guibg=" .. color)
end

local function fg_bg(group, fgcol, bgcol)
    cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

local function link(group1, group2)
    cmd("hi! link " .. group1 .. " " .. group2)
end

link("LineNr", "Normal")

bg("StatusLine", colors.statuslinenc)
bg("StatusLineNC", colors.statuslinenc)

fg("NvimTreeVertSplit", colors.bg)

fg("IndentBlankLineChar", colors.bg3)

bg("DiffAdd", "NONE")
bg("DiffChange", "NONE")
bg("DiffDelete", "NONE")
bg("DiffText", "NONE")
