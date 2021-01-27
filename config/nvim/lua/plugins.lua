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
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function()
            local lualine = require('lualine')
            lualine.status()
            lualine.theme = 'gruvbox'
            lualine.separator = '|'
    end
    }
    -- }}}

    -- barbar{{{
    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
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
            require 'colorizer'.setup()
        end}
    -- }}}

    -- fern{{{
    use {
        'lambdalisue/fern.vim',
        requires = {{'lambdalisue/fern-hijack.vim'}, {'lambdalisue/fern-git-status.vim'}, opt = true},
        config = function()
            vim.cmd('highlight FernRootText ctermfg=green guifg=#b8bb26')
            vim.cmd('highlight FernBranchText ctermfg=darkgreen guifg=#98971a')
            vim.cmd('highlight FernBranchSymbol ctermfg=green guifg=#b8bb26')
            vim.cmd('highlight FernLeafSymbol ctermfg=green guifg=#b8bb26')
        end
    }
    -- }}}

    use 'jiangmiao/auto-pairs'

    -- gruvbox8{{{
    use {
        'lifepillar/vim-gruvbox8',
        config = function()
            vim.api.nvim_set_var('gruvbox_filetype_hi_groups', 1)
            vim.api.nvim_set_var('gruvbox_plugin_hi_groups', 1)
        end
    }
    -- }}}
end)

-- vim: set foldmethod=marker:
