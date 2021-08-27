local present, feline = pcall(require, "feline")
if not present then
    return
end

local colors = require "colors"

local bo = vim.bo
local fn = vim.fn

local function filename()
    return " %<" .. fn.expand "%:t" .. " "
end

local function is_truncated(width)
    local current_width = vim.api.nvim_win_get_width(0)
    return current_width < width
end

local mode_colors = {
    ["n"]  = { "NORMAL",    "N",    colors.green },
    ["no"] = { "N-PENDING", "N-P",  colors.green },
    ["i"]  = { "INSERT",    "I",    colors.blue },
    ["ic"] = { "INSERT",    "I",    colors.blue },
    ["t"]  = { "TERMINAL",  "T",    colors.bg3 },
    ["v"]  = { "VISUAL",    "V",    colors.yellow },
    ["V"]  = { "V-LINE",    "V-L",  colors.yellow },
    [""] = { "V-BLOCK",   "V-B",  colors.yellow },
    ["R"]  = { "REPLACE",   "R",    colors.cyan },
    ["Rv"] = { "V-REPLACE", "V-R",  colors.cyan },
    ["s"]  = { "SELECT",    "S",    colors.cyan },
    ["S"]  = { "S-LINE",    "S-L",  colors.cyan },
    [""] = { "S-BLOCK",   "S-B",  colors.cyan },
    ["c"]  = { "COMMAND",   "C",    colors.bg3 },
    ["cv"] = { "COMMAND",   "C",    colors.bg3 },
    ["ce"] = { "COMMAND",   "C",    colors.bg3 },
    ["r"]  = { "PROMPT",    "P",    colors.bg3 },
    ["rm"] = { "MORE",      "M",    colors.bg3 },
    ["r?"] = { "CONFIRM",   "C",    colors.bg3 },
    ["!"]  = { "SHELL",     "S",    colors.bg3 },
}

local properties = {
    force_inactive = {
        filetypes = {},
        buftypes  = {},
        bufnames  = {}
    }
}

properties.force_inactive.filetypes = {
    "NvimTree",
    "packer"
}

properties.force_inactive.buftypes = {
    "terminal"
}

local components = {
    left  = {active = {}, inactive = {}},
    mid   = {active = {}, inactive = {}},
    right = {active = {}, inactive = {}}
}

components.left.active[1] = {
    provider = function()
        if is_truncated(80) then
            return " " .. mode_colors[fn.mode()][2] .. " "
        end

        return " " .. mode_colors[fn.mode()][1] .. " "
    end,
    hl = function()
        return {
            bg = mode_colors[fn.mode()][3],
            fg = colors.bg
        }
    end
}

components.left.active[2] = {
    provider = filename
}

components.left.active[3] = {
    provider = function()
        local modified = bo.modified

        if modified == true then
            return "%<+ "
        elseif is_truncated(35) then
            return ""
        else
            return ""
        end
    end
}

components.left.active[4] = {
    provider = function()
        if bo.readonly == true then
            return "%<ro "
        elseif is_truncated(35) then
            return ""
        else
            return ""
        end
    end
}

components.right.active[1] = {
    provider = function()
        local encoding = bo.fileencoding

        if encoding == "" or encoding == "utf-8" or is_truncated(57) then
            return ""
        end

        return encoding .. " "
    end
}

components.right.active[2] = {
    provider = function()
        local format = bo.fileformat

        if format == "" or format == "unix" or is_truncated(57) then
            return ""
        end

        return format .. " "
    end
}

components.right.active[3] = {
    provider = function()
        local filetype = bo.filetype

        if filetype == "" or is_truncated(35) then
            return ""
        end

        return filetype .. " "
    end
}

components.right.active[4] = {
    provider = function()
        return " " .. fn.line "." .. ":" .. fn.col "." .. " "
    end,
    hl = function()
        return {
            bg = mode_colors[fn.mode()][3]
        }
    end
}

components.left.inactive[1] = {
    provider = filename,
    hl = {
        bg = colors.statuslinenc
    }
}

feline.setup {
    default_bg = colors.statusline,
    default_fg = colors.bg,
    components = components,
    properties = properties
}
