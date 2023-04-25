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
        event = 'VeryLazy',
        dependencies = { 'nvim-tree/nvim-web-devicons' }, },
    { 'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' }, },
    { 'nvim-treesitter/nvim-treesitter',
        build = { ':TSUpdate' },
        event = { 'BufReadPost', 'BufNewFile' },
    },
    { -- fzf
        'junegunn/fzf',
        event = 'VeryLazy',
        dependencies = {
            'junegunn/fzf.vim',
            'dominickng/fzf-session.vim',
        },
    },
    { -- skk
        'vim-skk/skkeleton',
--        event = 'InsertEnter',
        dependencies = {
            'vim-denops/denops.vim',
            {
                'Shougo/ddc.vim',
                dependencies = {
                    'Shougo/ddc-matcher_head',
                    'Shougo/ddc-sorter_rank',
                    'Shougo/ddc-ui-native',
                },
            },
        },
    },
    { 'rhysd/vim-grammarous', ft = 'markdown' },
    { 'preservim/vim-wordy', ft = 'markdown' },
    { 'jeffkreeftmeijer/vim-numbertoggle', event = { 'BufReadPre', 'BufNewFile' },},
    { 'nvim-lua/plenary.nvim', },
    { 'lewis6991/gitsigns.nvim', event = { 'BufReadPre', 'BufNewFile' }, },
    { -- leap
        'ggandor/leap.nvim',
        event = 'VeryLazy',
        dependencies = { 'tpope/vim-repeat', },
    },
    { 'kylechui/nvim-surround',
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    { 'psliwka/vim-smoothie', },
    { 'voldikss/vim-browser-search', ft = 'markdown', },
    { -- lsp
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
    },
    { 'petertriho/nvim-scrollbar', },
    { 'kevinhwang91/nvim-hlslens', },
    { 'lambdalisue/readablefold.vim', event = { 'BufReadPre', 'BufNewFile' },},
    { 'akinsho/toggleterm.nvim', version = "*", config = true },
    { 'lukas-reineke/indent-blankline.nvim', event = { 'BufReadPre', 'BufNewFile' },},
    {
        'hrsh7th/nvim-cmp',
--        event = 'InsertEnter',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'f3fora/cmp-spell',
            'octaltree/cmp-look',
            { 'saadparwaiz1/cmp_luasnip', dependencies = { 'L3MON4D3/LuaSnip'},},
            'onsails/lspkind-nvim',
            'hrsh7th/cmp-nvim-lua',
            'jc-doyle/cmp-pandoc-references',
            { 'tzachar/cmp-tabnine', build = { './install.sh' }, },
--            'rinx/cmp-skkeleton',
        },
    },
    { 'jose-elias-alvarez/null-ls.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    { 'folke/which-key.nvim',
        -- event = "VeryLazy",
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        require("which-key").setup()
        end,
    },
    { 'folke/noice.nvim',
        event = 'VeryLazy',
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
}
