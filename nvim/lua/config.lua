-- publicly shared in github
local g = vim.g
local cmd = vim.cmd
local fn = vim.fn
local api = vim.api

-- folding
g.markdown_folding = 1
-- terminal
api.nvim_create_autocmd(
    { 'TermOpen' },
    { pattern = '*', command = 'startinsert', }
)

-- theme
--vim.api.nvim_set_hl(0, 'VertSplit', { fg = black })
cmd([[hi vertsplit guifg=grey]])

--serch engine
--setting for search over dictionary.com
-- \saw is going to look for a word under the cursor
g.browser_search_engines = {
    dictcom = 'https://www.dictionary.com/browse/%s',
    cambridge = 'https://dictionary.cambridge.org/us/dictionary/english-japanese/%s',
}
g.browser_search_default_engine = 'cambridge'
-- leap.nvim
--s with two words: search forward
--S with two words: search backward
--use cl instead of s
--use cc instead of S
require('leap').add_default_mappings()

--vim-repeat
fn['repeat#set'](api.nvim_replace_termcodes('<Plug>MyWonderfulMap', true, false, true), vim.v.count)

-- fzf_session setting
g.fzf_session_path = '/home/tomishing/.config/nvim/session'

-- skkeleton
fn['skkeleton#config']({
    globalJisyo = '~/.config/skk/SKK-JISYO.L'
})
fn['skkeleton#config']({
    userJisyo = '~/.config/skk/user.dic'
})
cmd([[call skkeleton#config({ 'eggLikeNewline':v:true })]])
cmd([[
call skkeleton#register_kanatable('rom', {
      \ 'jj': 'escape',
      \ 'z,': ['―'],
      \ })
]])

--UltiSnips
g.UltiSnipsDirectories = '~/.config/nvim/UltiSnips'
g.UltiSnipsEditSplit = 'vertical'

-- toggleterm setup
require("toggleterm").setup {}

--- lualineO
-- theme: eg. papercolor_dark
require('lualine').setup {
    options = {
        theme = 'auto',
        globalstatus = true,
    },
}

--- gitsigns

require('gitsigns').setup()

--- plenary settings

local async = require('plenary.async')

--- treesitter

require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "r",
        "json",
        "python",
        "lua",
        "html",
        "yaml",
        --        "vim",
    },
    --    ignore_install = { "markdown"},
    --    auto_install = true,
    highlight = { enable = true, },
}

--- scrollbar settings for scrollbar and hlslens
require('hlslens').setup()
require('scrollbar').setup()

--require('scrollbar.handlers.search').setup()

--- nvim-tree
require('nvim-tree').setup {
    diagnostics = {
        enable = true,
        show_on_dirs = false,
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
        },
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
}

-- Setup nvim-cmp.
local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup {

    formatting = {
        format = function(entry, vim_item)
            -- fancy icons and a name of kind
            vim_item.kind = lspkind.presets.default[vim_item.kind] ..
                " " .. vim_item.kind
            -- set a name for each source
            vim_item.menu = ({
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    ultisnips = "[UltiSnips]",
                    nvim_lua = "[Lua]",
                    look = "[Look]",
                    path = "[Path]",
                    spell = "[Spell]",
                    cmp_tabnine = "[TabNine]",
                    pandoc_references = "[Citation]",
                    --                skkeleton = "[Skk]"
                    --                cmp_pandoc = "[Pandoc]"
                })[entry.source.name]
            return vim_item
        end
    },

    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },

    mapping = {
        -- Use Tab and shift-Tab to navigate autocomplete menu
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs( -4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
    },

    sources = {
        { name = 'buffer' },
        { name = 'nvim_lsp' },
        { name = 'ultisnips' },
        { name = 'nvim_lua' },
        {
            name = 'look',
            keyword_length = 2,
            option = {
                convert_case = true,
                loud = true
            }
        },
        { name = 'path' },
        { name = 'spell' },
        ---        { name = 'cmp_pandoc' },
        { name = 'cmp_tabnine' },
        {
            name = 'pandoc_references'
        },
        --        { name = 'skkeleton' },
    },

}

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources(
        { { name = 'cmp_git' }, },
        { { name = 'buffer' }, }
    )
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', { sources = { { name = 'buffer' } } })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
})


-- lsp-server settings: mason, and mason-lspconfig
-- So far, lint is working well without this packages, these are ommited.
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup()

-- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local nvim_lsp = require('lspconfig')
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
local servers = { 'r_language_server', 'pyright', 'lua_ls', 'sqlls', 'vimls', 'html', 'marksman', 'yamlls', }

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        capabilities = capabilities,
    }
end

-- LSP handlers
--vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
--)

-- diagnostic settings
vim.diagnostic.config {
    virtual_text = true,
    signs = true,
    underline = false,
    update_in_insert = true,
}

-- cmp_pandoc settings
-- require('cmp_pandoc').setup()

-- tabnine settings

local tabnine = require('cmp_tabnine.config')
tabnine.setup({
    max_lines = 1000,
    max_num_results = 20,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = '..',
    ignored_file_types = { -- default is not to ignore
        -- uncomment to ignore in lua:
        -- lua = true
    },
})

-- indent-blankline settings
require('indent_blankline').setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}

-- null-ls, formatter
local null_ls = require('null-ls')
local b = null_ls.builtins

null_ls.setup({
    sources = {
        b.formatting.prettierd.with { filetype = { "html", "yaml", "markdown", "css" } },
        b.formatting.stylua,
    }
})
