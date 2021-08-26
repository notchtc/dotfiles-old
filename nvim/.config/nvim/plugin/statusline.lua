local api = vim.api
local M = {}

M.trunc_width = setmetatable( {
    -- You can adjust these values to your liking, if you want
    -- I promise this will all makes sense later :)
    mode      = 80,
    filename  = 140,
    filestuff = 57,
    }, {
        __index = function()
            return 80 -- handle edge cases, if there's any
        end
    })

M.is_truncated = function(_, width)
    local current_width = api.nvim_win_get_width(0)
    return current_width < width
end

M.colors = {
    normal     = '%#Normal#',
    mode       = '%#StatusLineMode#',
    active     = '%#StatusLine#',
    inactive   = '%#StatusLineNC#',
}

M.modes = setmetatable({
    ['n']  = {'normal', 'N'};
    ['no'] = {'n-pending', 'N-P'} ;
    ['v']  = {'visual', 'V' };
    ['V']  = {'v-line', 'V-L' };
    [''] = {'v-block', 'V-B'};
    ['s']  = {'select', 'S'};
    ['S']  = {'s-line', 'S-L'};
    [''] = {'s-block', 'S-B'};
    ['i']  = {'insert', 'I'};
    ['ic'] = {'insert', 'I'};
    ['R']  = {'replace', 'R'};
    ['Rv'] = {'v-replace', 'V-R'};
    ['c']  = {'command', 'C'};
    ['cv'] = {'vim-ex ', 'V-E'};
    ['ce'] = {'ex ', 'E'};
    ['r']  = {'prompt ', 'P'};
    ['rm'] = {'more ', 'M'};
    ['r?'] = {'confirm ', 'C'};
    ['!']  = {'shell ', 'S'};
    ['t']  = {'terminal ', 'T'};
}, {
        __index = function()
            return {'Unknown', 'U'} -- handle edge cases
        end
    })

M.get_current_mode = function(self)
    local current_mode = api.nvim_get_mode().mode

    if self:is_truncated(self.trunc_width.mode) then
        return string.format(' %s ', self.modes[current_mode][2]):upper()
    end

    return string.format(' %s ', self.modes[current_mode][1]):upper()
end

M.get_filename = function(self)
    if self:is_truncated(self.trunc_width.filename) then return ' %<%f ' end
    return ' %<%F '
end

M.get_modified = function()
    local modified = vim.bo.modified

    if modified == true then
        return '+ '
    else
        return ''
    end
end

M.get_readonly = function()
    local readonly = vim.bo.readonly

    if readonly == true then
        return 'ro '
    else
        return ''
    end
end

M.get_fileencoding = function(self)
    local fileencoding = vim.bo.fileencoding

    if self:is_truncated(self.trunc_width.filestuff) or fileencoding == '' or fileencoding == 'utf-8' then
        return ''
    end

    return string.format('%s ', fileencoding)
end

M.get_fileformat = function(self)
    local fileformat = vim.bo.fileformat

    if self:is_truncated(self.trunc_width.filestuff) or fileformat == '' or fileformat == 'unix' then
        return ''
    end

    return string.format('%s ', fileformat)
end

M.get_filetype = function(self)
    local filetype = vim.bo.filetype

    if filetype == '' then return '' end
    return string.format('%s ', filetype)
end

M.get_line_col = function()
    return ' %l:%c '
end

M.get_percentage = function(self)
    if self:is_truncated(self.trunc_width.line_col) then return '' end
    return '%p%% '
end

M.set_active = function(self)
    local colors = self.colors

    local mode = colors.mode .. self:get_current_mode()
    local filename = colors.active .. self:get_filename()
    local modified = self:get_modified()
    local readonly = self:get_readonly()
    local fileencoding = self:get_fileencoding()
    local fileformat = self:get_fileformat()
    local filetype = self:get_filetype()
    local line_col = colors.mode .. self:get_line_col()
    local percentage = self:get_percentage()

    return table.concat({
        mode, filename, modified, readonly, '%=', fileencoding, fileformat, filetype, line_col, percentage
    })
end

M.set_inactive = function(self)
    return self.colors.inactive .. self:get_filename()
end

M.set_explorer = function(self)
    return self.colors.active
end

Statusline = setmetatable(M, {
    __call = function(self, mode)
        return self["set_" .. mode](self)
    end
})

api.nvim_exec([[
augroup Statusline
    au!
    au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline('active')
    au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline('inactive')
    au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline('explorer')
augroup END
]], false)
