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

    -- everforest{{{
    use {
        'sainnhe/everforest',
        config = function()
            vim.g.everforest_background = 'medium'
            vim.g.everforest_sign_column_background = 'none'
            vim.cmd("colorscheme everforest")
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
                set linebreak
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
                set nolinebreak
            endfunction
            ]]
            vim.cmd('autocmd! User GoyoEnter nested call <SID>goyo_enter()')
            vim.cmd('autocmd! User GoyoLeave nested call <SID>goyo_leave()')
        end
    }
    -- }}}

    use 'lukas-reineke/indent-blankline.nvim'

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

    -- nvim-tree.lua{{{
    use {
        'kyazdani42/nvim-tree.lua',
        config = function()
            vim.g.nvim_tree_git_hl = 1
            vim.g.nvim_tree_auto_open = 1
            vim.g.nvim_tree_auto_close = 1
            vim.g.nvim_tree_hijack_netrw = 1
            vim.g.nvim_tree_show_icons = {
                git = 0,
                folders = 0,
                files = 0,
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
                ignore_install = {'c'},
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
            -- Make gitgutter update faster
            vim.o.updatetime = 100
        end
    }
    -- }}}
end)

-- vim: set foldmethod=marker:
