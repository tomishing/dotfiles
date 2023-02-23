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
    { -- lualine
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    { -- lualine
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    { -- treesitter
        'nvim-treesitter/nvim-treesitter',
        build = { ':TSUpdate' },
    },
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
}
