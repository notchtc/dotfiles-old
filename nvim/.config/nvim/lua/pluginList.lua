local present, _ = pcall(require, "packerInit")
local packer

if present then
    packer = require "packer"
else
    return false
end

local use = packer.use

return packer.startup(
    function()
        use {
            "wbthomason/packer.nvim",
            event = "VimEnter"
        }

        use {
            "nvim-lua/plenary.nvim",
            event = "BufRead"
        }

        use {
            "overcache/NeoSolarized",
            after  = "packer.nvim",
            config = function()
                require "theme"
            end
        }

        use {
            "nvim-treesitter/nvim-treesitter",
            event  = "BufRead",
            config = function()
                require("plugins.treesitter").treesitter()
            end
        }

        use {
            "p00f/nvim-ts-rainbow",
            after  = "nvim-treesitter",
            config = function()
                require("plugins.treesitter").rainbow()
            end
        }

        use {
            "lukas-reineke/indent-blankline.nvim",
            event  = "BufRead",
            setup  = function()
                require "plugins.blankline"
            end
        }

        use {
            "lewis6991/gitsigns.nvim",
            after  = "plenary.nvim",
            config = function()
                require "plugins.gitsigns"
            end
        }

        use {
            "akinsho/nvim-bufferline.lua",
            event  = "BufWinEnter",
            config = function()
                require "plugins.bufferline"
            end,
            setup = function()
                require("mappings").bufferline()
            end
        }

        use {
            "norcalli/nvim-colorizer.lua",
            event  = "BufRead",
            config = function()
                require "plugins.colorizer"
            end
        }

        use {
            "kyazdani42/nvim-tree.lua",
            cmd    = "NvimTreeToggle",
            config = function()
                require "plugins.nvimtree"
            end,
            setup = function()
                require("mappings").nvimtree()
            end
        }
end)
