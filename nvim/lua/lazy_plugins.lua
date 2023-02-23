local cmd = vim.cmd

return {
    { -- colorschemes
        'EdenEast/nightfox.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            cmd.colorscheme('nordfox') 
        end,
    },
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }, },
    { 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons' }, },
    { 'nvim-treesitter/nvim-treesitter', build = { ':TSUpdate' }, },
    { -- fzf
        'junegunn/fzf',
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
    {  'SirVer/ultisnips', dependencies = { 'honza/vim-snippets' }, },
    { 'iamcco/markdown-preview.nvim', },
    { 'rhysd/vim-grammarous', },
    { 'preservim/vim-wordy', },
    { 'jeffkreeftmeijer/vim-numbertoggle', },
    { 'nvim-lua/plenary.nvim', },
    { 'lewis6991/gitsigns.nvim', },
    { 'tpope/vim-repeat', },
    { 'tpope/vim-fugitive', },
    { 'psliwka/vim-smoothie', },
    { 'voldikss/vim-browser-search', },
    { 'justinmk/vim-sneak', },
    { -- mason
        'williamboman/mason.nvim',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            'neovim/nvim-lspconfig',
        },
    },
    { 'petertriho/nvim-scrollbar', },
    { 'kevinhwang91/nvim-hlslens', },
    { 'lambdalisue/readablefold.vim', },
    { 'akinsho/toggleterm.nvim', version = "*", config = true },
    { 'lukas-reineke/indent-blankline.nvim', },
    {
        'hrsh7th/nvim-cmp',
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
        },
    },
    { 'tzachar/cmp-tabnine', build = { './install.sh' }, },
}
