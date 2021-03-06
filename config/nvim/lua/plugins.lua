local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- indentLine{{{
    use {
        'Yggdroot/indentLine',
        config = function()
            -- Set indentLine color
            vim.api.nvim_set_var('indentLine_defaultGroup', 'SpecialKey')

            -- Set indentLine characters
            vim.api.nvim_set_var('indentLine_char_list', {'│', '┆', '┊', ''})
            -- Don't show indentLine in specific things
            vim.api.nvim_set_var('indentLine_fileTypeExclude', {'fern'})
            vim.api.nvim_set_var('indentLine_bufTypeExclude', {'help'})
        end
    }
    -- }}}

    -- gitgutter{{{
    use {
        'airblade/vim-gitgutter',
        config = function()
            -- Make gitgutter fit in
            vim.cmd("hi! link SignColumn LineNr")
            vim.api.nvim_set_var('gitgutter_set_sign_backgrounds', 1)

            -- Make gitgutter update faster
            vim.api.nvim_set_option('updatetime', 100)
        end
    }
    -- }}}

    -- fish{{{
    use {
        'dag/vim-fish',
        config = function()
            -- Set up :make to use fish for syntax checking
            vim.cmd('autocmd FileType fish compiler fish')

            -- Enable folding of block structures in fish
            vim.cmd('autocmd FileType fish set foldmethod=expr')
        end
    }
    -- }}}

    -- lualine{{{
    use {
        'hoob3rt/lualine.nvim',
        config = function()
            local lualine = require('lualine')
            lualine.options = {
                theme = 'forest_night',
                section_separators = nil,
                component_separators = '|',
                icons_enabled = false
            }
            lualine.status()
    end
    }
    -- }}}

    -- barbar{{{
    use {
        'romgrk/barbar.nvim',
        config = function()
            vim.cmd("hi! link BufferTabpageFill Normal")
            vim.cmd("let bufferline = get(g:, 'bufferline', {})")
            vim.cmd("let bufferline.auto_hide = v:true")
            vim.cmd("let bufferline.icons = v:false")
            vim.cmd("let bufferline.animation = v:false")
            vim.cmd("let bufferline.maximum_padding = 2")
        end
    }
    -- }}}

    -- rainbow {{{
    use {
        'luochen1990/rainbow',
        config = function()
            -- Enable rainbow parentheses
            vim.api.nvim_set_var('rainbow_active', 1)
        end
    }
    -- }}}

    -- colorizer {{{
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require 'colorizer'.setup {
                '*';
                '!fern';
                '!packer';
            }
        end}
    -- }}}

    -- fern{{{
    use {
        'lambdalisue/fern.vim',
        requires = {{'lambdalisue/fern-hijack.vim'}, {'lambdalisue/fern-git-status.vim'}, opt = true},
        config = function()
            vim.cmd('hi FernRootText ctermfg=green guifg=#c3e88D')
            vim.cmd('hi FernBranchText ctermfg=darkgreen guifg=#98971a')
            vim.cmd('hi FernBranchSymbol ctermfg=green guifg=#b8bb26')
            vim.cmd('hi FernLeafSymbol ctermfg=green guifg=#b8bb26')
        end
    }
    -- }}}

    use 'sainnhe/forest-night'
end)

-- vim: set foldmethod=marker:
