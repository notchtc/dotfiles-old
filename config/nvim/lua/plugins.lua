local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.cmd('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    vim.cmd'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')

return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- barbar.nvim{{{
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

    -- fern.vim{{{
    use {
        'lambdalisue/fern.vim',
        requires = {{'lambdalisue/fern-hijack.vim'}, {'lambdalisue/fern-git-status.vim'}, opt = true},
        config = function()
            -- Disable line numbers in fern
            vim.cmd('autocmd FileType fern set nonu nornu')
        end
    }
    -- }}}

    -- forest-night{{{
    use {
        'sainnhe/forest-night',
        config = function()
            vim.g.forest_night_background = 'medium'
            vim.g.forest_night_sign_column_background = 'none'
            vim.cmd("colorscheme forest-night")
        end
    }
    -- }}}

    -- goyo.vim{{{
    use {
        'junegunn/goyo.vim',
        config = function()
            vim.g.goyo_width = 110
            vim.g.goyo_height = '90%'
            vim.cmd[[
            function! s:goyo_enter()
                let b:quitting = 0
                let b:quitting_bang = 0
                autocmd QuitPre <buffer> let b:quitting = 1
                cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!

                BarbarDisable
                set showtabline=0
                Limelight
            endfunction

            function! s:goyo_leave()
                " Quit Vim if this is the only remaining buffer
                if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
                    if b:quitting_bang
                        qa!
                    else
                        qa
                    endif
                endif
                set showtabline=2
                BarbarEnable
                Limelight!
            endfunction
            ]]
            vim.cmd('autocmd! User GoyoEnter nested call <SID>goyo_enter()')
            vim.cmd('autocmd! User GoyoLeave nested call <SID>goyo_leave()')
        end
    }
    -- }}}

    -- indentLine{{{
    use {
        'Yggdroot/indentLine',
        config = function()
            -- Set indentLine color
            vim.g.indentLine_defaultGroup = 'SpecialKey'

            -- Set indentLine characters
            vim.g.indentLine_char_list = {'│', '┆', '┊', ''}

            -- Don't show indentLine in specific things
            vim.g.indentLine_fileTypeExclude = {'fern', 'txt', 'packer'}
            vim.g.indentLine_bufTypeExclude = {'help'}
        end
    }
    -- }}}

    -- nvim-colorizer.lua {{{
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require 'colorizer'.setup {
                '*';
                '!fern';
                '!packer';
            }
        end
    }
    -- }}}

    -- nvim-treesitter{{{
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = {'lua', 'css', 'html'},
                highlight = {
                    enable = true
                }
            }
        end
    }
    -- }}}

    -- limelight.vim{{{
    use {
        'junegunn/limelight.vim',
        config = function()
            vim.g.limelight_paragraph_span = 1
            vim.g.limelight_priority = -1
        end
    }
    -- }}}

    -- rainbow {{{
    use {
        'luochen1990/rainbow',
        config = function()
            -- Enable rainbow parentheses
            vim.g.rainbow_active = 1
        end
    }
    -- }}}

    use 'tpope/vim-fugitive'

    -- vim-gitgutter{{{
    use {
        'airblade/vim-gitgutter',
        config = function()
            -- Make gitgutter fit in
            vim.cmd("hi! link SignColumn LineNr")
            vim.g.gitgutter_set_sign_backgrounds = 1

            -- Make gitgutter update faster
            vim.o.updatetime = 100
        end
    }
    -- }}}
end)

-- vim: set foldmethod=marker:
