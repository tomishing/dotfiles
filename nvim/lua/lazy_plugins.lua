return {
    { -- colorschemes
        'EdenEast/nightfox.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme('nordfox')
        end,
    },
    { 'nvim-lualine/lualine.nvim',
        lazy = true,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    },
    { 'nvim-tree/nvim-tree.lua',
        lazy = true,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    },
    { 'nvim-treesitter/nvim-treesitter',
        lazy = true,
        build = { ':TSUpdate' },
        event = { 'BufReadPost', 'BufNewFile' },
    },
    { -- fzf
        'junegunn/fzf',
--        build = "./install --bin",
        event = 'VeryLazy',
        dependencies = {
            'junegunn/fzf.vim',
            'dominickng/fzf-session.vim',
        },
    },
--    { 'vim-skk/skkeleton',
--       dependencies = {
--           'vim-denops/denops.vim',
--           event = 'InsertEnter',
--       },
--    },
    { 'rhysd/vim-grammarous', ft = 'markdown' },
    { 'preservim/vim-wordy', ft = 'markdown' },
    { 'jeffkreeftmeijer/vim-numbertoggle', event = { 'BufReadPre', 'BufNewFile' },},
    { 'lewis6991/gitsigns.nvim', event = { 'BufReadPre', 'BufNewFile' }, },
    { -- leap
        'ggandor/leap.nvim',
        lazy = true,
        event = 'VeryLazy',
        dependencies = { 'tpope/vim-repeat', },
    },
    { 'kylechui/nvim-surround',
        lazy = true,
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    { 'psliwka/vim-smoothie', },
    { -- lsp
        'neovim/nvim-lspconfig',
        lazy = true,
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
    },
    { 'petertriho/nvim-scrollbar', },
    { 'kevinhwang91/nvim-hlslens', lazy = true },
    { 'lambdalisue/readablefold.vim', event = { 'BufReadPre', 'BufNewFile' },},
    { 'akinsho/toggleterm.nvim', version = "*", config = true },
--    { 'lukas-reineke/indent-blankline.nvim',
--        main = "ibl",
--        opts = {},
--        event = { 'BufReadPre', 'BufNewFile' },
--        config = function()
--            require('ibl').setup()
--        end
--    },
    {
      "shellRaining/hlchunk.nvim",
      event = { "BufReadPre", "BufNewFile" },
      config = function()
        require("hlchunk").setup({
            chunk = {
                enable = true
            },
            indent = {
                enable = true
            }
      })
      end
    },
    {
        'hrsh7th/nvim-cmp',
--        event = 'InsertEnter',
        lazy = true,
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-emoji',
            'f3fora/cmp-spell',
            'octaltree/cmp-look',
            { 'saadparwaiz1/cmp_luasnip', dependencies = { 'L3MON4D3/LuaSnip'},},
            'onsails/lspkind-nvim',
            'hrsh7th/cmp-nvim-lua',
            -- { 'jc-doyle/cmp-pandoc-references',
            --    ft = { 'markdown', 'pandoc', 'rmd', 'quarto', 'qmd' },
            -- },
            'aspeddro/cmp-pandoc.nvim',
            'jmbuhr/otter.nvim',
--            'rinx/cmp-skkeleton',
        },
    },
--    { 'jose-elias-alvarez/null-ls.nvim',
    { 'nvimtools/none-ls.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    { 'folke/which-key.nvim',
        event = "VeryLazy",
        keys = {
           {
            "<leader>?",
            function()
              require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
           },
        },
    },
    { 'folke/noice.nvim',
        lazy = true,
       -- event = 'VeryLazy',
        config = function()
            require("noice").setup({
                -- add any options here
            })
        end,
        dependencies = {
            'MunifTanjim/nui.nvim',
            "rcarriga/nvim-notify",
        },
    },
    { 'dhruvasagar/vim-table-mode', ft = 'markdown', },
    { 'RRethy/vim-illuminate',
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'quarto-dev/quarto-nvim',
    },
--    {
--        'brianhuster/live-preview.nvim',
--    },
    {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter',
                    'nvim-tree/nvim-web-devicons' },
    opts = {},
    },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    { 'echasnovski/mini.nvim', version = '*' },
    { 'norcalli/nvim-colorizer.lua',
        config = function()
            require("colorizer").setup({
              '*';
              css= { rgb_fn = true; };
              html = { names = false; };
            })
        end,
    },
}
