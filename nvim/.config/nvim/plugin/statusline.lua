local bo = vim.bo

local colors = require "colors"

-- stylua: ignore
local mode_colors = {
    ["n"]  = { "normal", colors.green },
    ["no"] = { "n-pending", colors.green },
    ["i"]  = { "insert", colors.blue },
    ["ic"] = { "insert", colors.blue },
    ["t"]  = { "terminal", colors.green },
    ["v"]  = { "visual", colors.yellow },
    ["V"]  = { "v-line", colors.yellow },
    [""] = { "v-block", colors.yellow },
    ["R"]  = { "replace", colors.cyan },
    ["Rv"] = { "v-replace", colors.cyan },
    ["s"]  = { "select", colors.cyan },
    ["S"]  = { "s-line", colors.cyan },
    [""] = { "s-block", colors.cyan },
    ["c"]  = { "command", colors.green },
    ["cv"] = { "command", colors.green },
    ["ce"] = { "command", colors.green },
    ["r"]  = { "prompt", colors.green },
    ["rm"] = { "more", colors.green },
    ["r?"] = { "confirm", colors.green },
    ["!"]  = { "shell", colors.green },
}

local function mode()
    vim.cmd("hi StatusLineMode guifg=" .. mode_colors[vim.fn.mode()][2])

    return mode_colors[vim.fn.mode()][1] .. " "
end

local function fileencoding()
    local encoding = bo.fileencoding

    if encoding == "utf-8" then
        return ""
    else
        return encoding .. " "
    end
end

local function fileformat()
    local format = bo.fileformat

    if format == "unix" then
        return ""
    else
        return format .. " "
    end
end

local function filetype()
    local type = bo.filetype

    if type == "" then
        return ""
    else
        return type .. " "

    end
end

function statusline()
    local stl = {
        "%#StatusLineMode#",
        mode(),
        "%#Normal#",
        "%f%< ",
        "%M ",
        "%R",
        "%=",
        fileencoding(),
        fileformat(),
        filetype(),
        "%l:%c",
    }
    return table.concat(stl)
end

vim.opt.statusline = "%!luaeval('statusline()')"
