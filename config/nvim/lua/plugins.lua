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
        requires = 'kyazdani42/nvim-web-devicons',
        config   = function()
            vim.cmd("hi! link BufferTabpageFill Normal")
            vim.cmd("let bufferline = get(g:, 'bufferline', {})")
            vim.cmd("let bufferline.auto_hide = v:true")
            vim.cmd("let bufferline.icons = v:true")
            vim.cmd("let bufferline.animation = v:false")
            vim.cmd("let bufferline.maximum_padding = 2")
        end
    }
    --}}}

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

    -- gitsigns.nvim{{{
    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config   = function()
            require('gitsigns').setup {
                signs = {
                    add          = { text = '│' },
                    change       = { text = '│' },
                    delete       = { text = '╵' },
                    topdelete    = { text = '╷' },
                    changedelete = { text = '╰' }
                }
            }
        end
    }
    -- }}}

    -- indent-blankline.nvim{{{
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            vim.g.indent_blankline_char_list = {'│', '┆', '┊', ''}
            vim.g.indent_blankline_show_first_indent_level = false
            vim.g.indent_blankline_show_foldtext = false
            vim.g.indent_blankline_filetype_exclude = {'fern', 'txt', 'packer', 'help'}
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
        requires = 'kyazdani42/nvim-web-devicons',
        config   = function()
            vim.g.nvim_tree_git_hl = 1
            vim.g.nvim_tree_auto_open = 1
            vim.g.nvim_tree_auto_close = 1
            vim.g.nvim_tree_hijack_netrw = 1
            vim.g.nvim_tree_show_icons = {
                git = 1,
                folders = 1,
                files = 1,
            }

            vim.g.nvim_tree_icons = {
                git = {
                    unstaged = '',
                    staged = '',
                    renamed = '',
                    untracked = '',
                    deleted = '',
                    ignored = '',
                }
            }
        end
    }
    -- }}}

    -- nvim-treesitter{{{
    use {
        'nvim-treesitter/nvim-treesitter',
        run    = ':TSUpdate',
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

    -- nvim-ts-rainbow {{{
    use {
        'p00f/nvim-ts-rainbow',
        requires = 'nvim-treesitter/nvim-treesitter',
        config = function()
            require'nvim-treesitter.configs'.setup {
                rainbow = {
                    enable = true,
                    extended_mode = true,
                    max_file_lines = 5000
                }
            }
        end
    }
    -- }}}

    use 'tpope/vim-fugitive'
end)
-- vim: set foldmethod=marker:
