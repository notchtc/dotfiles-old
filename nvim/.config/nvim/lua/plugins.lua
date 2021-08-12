-- BOOTSTRAP

local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.cmd('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    vim.cmd('packadd packer.nvim')
end

-- Only required if you have packer configued as `opt`
vim.cmd('packadd packer.nvim')

return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- barbar.nvim {{{
    use {
        'romgrk/barbar.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config   = function()
            -- Setting the color of the filler after the buffer section
            vim.cmd("hi! link BufferTabpageFill Normal")
            -- NOTE: If barbar's option dict isn't created yet, create it
            vim.cmd("let bufferline = get(g:, 'bufferline', {})")
            -- Enable auto-hiding the bar when there is a single buffer
            vim.cmd("let bufferline.auto_hide = v:true")
            -- Disable icons
            vim.cmd("let bufferline.icons = v:true")
            -- Disable animations
            vim.cmd("let bufferline.animation = v:false")
            -- Sets the maximum padding width with which to surround each tab
            vim.cmd("let bufferline.maximum_padding = 2")
        end
    }
    -- }}}

    -- everforest {{{
    use {
        'sainnhe/everforest',
        config = function()
            if vim.fn.has('termguicolors') == 1 then
                vim.o.termguicolors = true
            end
            vim.g.everforest_enable_italic = 1
            vim.g.everforest_disable_italic_comment = 1
            vim.g.everforest_sign_column_background = 'none'
            vim.g.everforest_show_eob = 0
            vim.cmd('colorscheme everforest')
        end
    }
    -- }}}

    -- gitsigns.nvim {{{
    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config   = function()
            require('gitsigns').setup {
                -- Set characters used by gitsigns.nvim
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

    -- indent-blankline.nvim {{{
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            -- List of characters to be used as an indent line for each indentation level
            vim.g.indent_blankline_char_list = {'│', '┆', '┊', ''}
            -- Don't display indentation in the first column
            vim.g.indent_blankline_show_first_indent_level = false
            -- Don't display the full fold text
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
                -- Attach to all filetypes
                '*';
                -- Exclude fern from highlighting
                '!fern';
                -- Exclude packer from highlighting
                '!packer';
            }
        end
    }
    -- }}}

    -- nvim-tree.lua {{{
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config   = function()
            -- Enable file highlight for git attributes
            vim.g.nvim_tree_git_hl = 1
            -- Open the tree by default when opening (n)vim or (n)vim $DIR
            vim.g.nvim_tree_auto_open = 1
            -- Close the tree when it's the last window
            vim.g.nvim_tree_auto_close = 1
            -- Prevent netrw from automatically opening when opening directories
            vim.g.nvim_tree_hijack_netrw = 1
            -- Show git, folder and file icons
            vim.g.nvim_tree_show_icons = {
                git = 1,
                folders = 1,
                files = 1,
            }

            -- Set git icons
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

    -- nvim-treesitter {{{
    use {
        'nvim-treesitter/nvim-treesitter',
        run    = ':TSUpdate',
        config = function()
            require'nvim-treesitter.configs'.setup {
                -- Ensure parsers are installed for these languages
                ensure_installed = {'lua', 'css', 'html'},
                -- Don't install the parser for C
                ignore_install = {'c'},
                -- Enable highlighting
                highlight = {
                    enable = true
                },
                -- Enable indentation
                indent = {
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
                    -- Enable rainbow parentheses
                    enable = true,
                    -- Highlight also non-parentheses delimiters
                    extended_mode = true,
                    -- Do not enable for files with more than 5000 lines
                    max_file_lines = 5000
                }
            }
        end
    }
    -- }}}

    use 'tpope/vim-fugitive'
end)
-- vim: set foldmethod=marker:
