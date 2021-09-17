local present, feline = pcall(require, "feline")
if not present then
    return
end

local colors = require "colors"

local bo = vim.bo
local fn = vim.fn
local api = vim.api

local components = {
    active = {},
    inactive = {},
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

-- stylua: ignore
local mode_colors = {
    ["n"]  = { "NORMAL", "N", colors.green },
    ["no"] = { "N-PENDING", "N-P", colors.green },
    ["i"]  = { "INSERT", "I", colors.blue },
    ["ic"] = { "INSERT", "I", colors.blue },
    ["t"]  = { "TERMINAL", "T", colors.bg3 },
    ["v"]  = { "VISUAL", "V", colors.yellow },
    ["V"]  = { "V-LINE", "V-L", colors.yellow },
    [""] = { "V-BLOCK", "V-B", colors.yellow },
    ["R"]  = { "REPLACE", "R", colors.cyan },
    ["Rv"] = { "V-REPLACE", "V-R", colors.cyan },
    ["s"]  = { "SELECT", "S", colors.cyan },
    ["S"]  = { "S-LINE", "S-L", colors.cyan },
    [""] = { "S-BLOCK", "S-B", colors.cyan },
    ["c"]  = { "COMMAND", "C", colors.bg3 },
    ["cv"] = { "COMMAND", "C", colors.bg3 },
    ["ce"] = { "COMMAND", "C", colors.bg3 },
    ["r"]  = { "PROMPT", "P", colors.bg3 },
    ["rm"] = { "MORE", "M", colors.bg3 },
    ["r?"] = { "CONFIRM", "C", colors.bg3 },
    ["!"]  = { "SHELL", "S", colors.bg3 },
}

local mode_hl = function()
    return {
        bg = mode_colors[fn.mode()][3],
        fg = colors.bg,
    }
end

components.active[1][1] = {
    provider = function(winid)
        if api.nvim_win_get_width(winid) < 80 then
            return " " .. mode_colors[fn.mode()][2] .. " "
        end

        return " " .. mode_colors[fn.mode()][1] .. " "
    end,
    hl = mode_hl,
}

components.active[1][2] = {
    provider = function()
        return " %<" .. fn.expand "%:t" .. " "
    end,
}

components.active[1][3] = {
    provider = function()
        return "+ "
    end,

    enabled = function(winid)
        if bo.modified == true then
            if api.nvim_win_get_width(winid) > 57 then
                return true
            else
                return false
            end
        else
            return false
        end
    end,
}

components.active[1][4] = {
    provider = function()
        return "ro "
    end,

    enabled = function(winid)
        if bo.readonly == true then
            if api.nvim_win_get_width(winid) > 57 then
                return true
            else
                return false
            end
        else
            return false
        end
    end,
}

components.active[3][1] = {
    provider = function()
        return bo.fileencoding .. " "
    end,

    enabled = function(winid)
        if bo.fileencoding == "" or bo.fileencoding == "utf-8" then
            return false
        else
            return api.nvim_win_get_width(winid) > 57
        end
    end,
}

components.active[3][2] = {
    provider = function()
        return bo.format .. " "
    end,

    enabled = function(winid)
        if bo.fileformat == "" or bo.fileformat == "unix" then
            return false
        else
            return api.nvim_win_get_width(winid) > 57
        end
    end,
}

components.active[3][3] = {
    provider = function()
        return bo.filetype .. " "
    end,

    enabled = function(winid)
        if bo.filetype == "" then
            return false
        else
            return api.nvim_win_get_width(winid) > 35
        end
    end,
}

components.active[3][4] = {
    provider = function()
        return string.format(" %d:%d ", fn.line ".", fn.col ".")
    end,
    hl = mode_hl,
}

components.inactive[1][1] = {
    provider = "",
    hl = {
        bg = colors.statuslinenc,
    },
}

feline.setup {
    colors = {
        bg = colors.statusline,
        fg = colors.bg,
    },
    components = components,
}
