local g = vim.g
local cmd = vim.cmd

local colors = require "colors"

g.everforest_sign_column_background = "none"
g.everforest_show_eob = false

cmd "colorscheme everforest"

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

fg_bg("StatusLine", colors.fg, colors.bg)
fg_bg("StatusLineNC", colors.bg2, colors.bg)

fg("NvimTreeVertSplit", colors.bg)

fg("IndentBlankLineChar", colors.bg2)

fg_bg("DiffAdd", colors.green, "NONE")
fg_bg("DiffChange", colors.blue, "NONE")
fg_bg("DiffDelete", colors.red, "NONE")
fg_bg("DiffText", colors.blue, "NONE")
