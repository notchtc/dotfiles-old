local present, packer = pcall(require, "packerInit")

if not present then
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
            "ishan9299/nvim-solarized-lua",
            after  = "packer.nvim",
            config = function()
                require "theme"
            end
        }

        use {
            "nvim-treesitter/nvim-treesitter",
            event  = "BufRead",
            config = function()
                require "plugins.treesitter"
            end
        }

        use {
            "lukas-reineke/indent-blankline.nvim",
            event  = "BufRead",
            setup  = function()
                require("plugins.others").blankline()
            end
        }

        use {
            "lewis6991/gitsigns.nvim",
            config = function()
                require "plugins.gitsigns"
            end,
            setup  = function()
                require("utils").packer_lazy_load "gitsigns.nvim"
            end
        }

        use {
            "akinsho/nvim-bufferline.lua",
            after  = "nvim-solarized-lua",
            config = function()
                require "plugins.bufferline"
            end,
            setup = function()
                require("mappings").bufferline()
            end
        }

        use {
            "norcalli/nvim-colorizer.lua",
            cmd    = "ColorizerAttachToBuffer",
            config = function()
                require("plugins.others").colorizer()
            end,
            setup = function()
                require("mappings").colorizer()
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
