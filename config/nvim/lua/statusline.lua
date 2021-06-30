local mode_map = {
    ['n']  = 'normal',
    ['no'] = 'n-operator pending',
    ['v']  = 'visual',
    ['V']  = 'v-line',
    [''] = 'v-block',
    ['s']  = 'select',
    ['S']  = 's-line',
    [''] = 's-block',
    ['i']  = 'insert',
    ['R']  = 'replace',
    ['Rv'] = 'v-replace',
    ['c']  = 'command',
    ['cv'] = 'vim ex',
    ['ce'] = 'ex',
    ['r']  = 'prompt',
    ['rm'] = 'more',
    ['r?'] = 'confirm',
    ['!']  = 'shell',
    ['t']  = 'terminal'
}

local function mode()
    local m = vim.api.nvim_get_mode().mode
    if mode_map[m] == nil then return m end
    return mode_map[m]
end

function statusline()
    local status = ''
    status = status .. '%#Search#'
    status = status .. ' ' .. mode() .. ' '
    status = status .. '%#StatusLine#'
    status = status .. ' %-0.25t'
    status = status .. '%( %M%)'
    status = status .. '%( %R%)'
    status = status .. '%( %W%)'
    status = status .. '%='
    status = status .. ' %([%{&fileencoding?&fileencoding:&encoding}] %)'
    status = status .. '%([%{&fileformat}] %)'
    status = status .. '%(%y %)'
    status = status .. '%#Search#'
    status = status .. ' %l:%c'
    status = status .. ' %p%% '
    return status
end

vim.o.statusline = '%!luaeval("statusline()")'
