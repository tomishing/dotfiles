return {
    { -- colorschemes
        'EdenEast/nightfox.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme('nordfox')
        end,
    },
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }, },
    { 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons' }, },
    { 'nvim-treesitter/nvim-treesitter', build = { ':TSUpdate' }, },
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
        dependencies = {
            'vim-denops/denops.vim',
            'Shougo/ddc.vim',
        },
    },
    { 'SirVer/ultisnips', dependencies = { 'honza/vim-snippets' }, },
    { 'iamcco/markdown-preview.nvim', ft = 'markdown' },
    { 'rhysd/vim-grammarous', ft = 'markdown' },
    { 'preservim/vim-wordy', ft = 'markdown' },
    { 'jeffkreeftmeijer/vim-numbertoggle', event = { "BufReadPre", "BufNewFile" },},
    { 'nvim-lua/plenary.nvim', },
    { 'lewis6991/gitsigns.nvim', event = { "BufReadPre", "BufNewFile" }, },
    { -- leap
        'ggandor/leap.nvim',
        event = 'VeryLazy',
        dependencies = { 'tpope/vim-repeat', },
    },
    { 'tpope/vim-surround', event = 'InsertEnter', },
    { 'psliwka/vim-smoothie', },
    { 'voldikss/vim-browser-search', keys = {'<Leader>saw'},},
    { -- lsp
        'neovim/nvim-lspconfig',
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
    },
    { 'petertriho/nvim-scrollbar', },
    { 'kevinhwang91/nvim-hlslens', },
    { 'lambdalisue/readablefold.vim', },
    { 'akinsho/toggleterm.nvim', version = "*", config = true },
    { 'lukas-reineke/indent-blankline.nvim', },
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'f3fora/cmp-spell',
            'octaltree/cmp-look',
            'quangnguyen30192/cmp-nvim-ultisnips',
            'onsails/lspkind-nvim',
            'hrsh7th/cmp-nvim-lua',
            'jc-doyle/cmp-pandoc-references',
            { 'tzachar/cmp-tabnine', build = { './install.sh' }, },
        },
    },
    { 'jose-elias-alvarez/null-ls.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, },
}
