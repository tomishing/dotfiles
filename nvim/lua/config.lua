-- publicly shared in github
local g = vim.g
local cmd = vim.cmd
local fn = vim.fn
local api = vim.api
local bo = vim.bo

-- folding
g.markdown_folding = 1

-- theme
api.nvim_set_hl(0, 'WinSeparator', { fg = 'grey', bg = 'None', default = true } )

--serch engine
--setting for search over dictionary.com
-- \saw is going to look for a word under the cursor
g.browser_search_engines = {
    dictcom = 'https://www.dictionary.com/browse/%s',
    cambridge_j = 'https://dictionary.cambridge.org/us/dictionary/english-japanese/%s',
    cambridge = 'https://dictionary.cambridge.org/us/dictionary/english/%s',
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
    globalJisyo = '~/.config/skk/SKK-JISYO.L',
    userJisyo = '~/.config/skk/user.dic',
    eggLikeNewline = true
})
fn['skkeleton#register_kanatable']('rom', {
    ['z,'] = { '―', '' },
    ['/'] = { '・', ''},
    ['('] = {'（', ''},
    [')'] = {'）', ''},
    ['jj'] = 'escape',
})

-- skkeleton and ddc
fn['ddc#custom#patch_global']{
    sources = {'skkeleton'},
    sourceOptions = {
        skkeleton = {
        mark = 'Skkeleton',
        matchers = {'skkeleton'},
        sorters = {},
        minAutoCompleteLength = 4,
        },
        },
    }
fn['ddc#enable']()
fn['ddc#custom#patch_global']('ui', 'native')

-- toggleterm setup
require("toggleterm").setup {}

--- lualineO
-- theme: eg. papercolor_dark

local function getWords()
    local words = fn.wordcount().words .. " words"
    if bo.filetype == 'markdown' then
        return words
    else
        return nil
    end
end

require('lualine').setup {
    options = {
        theme = 'auto',
        -- globalstatus = true,
    },
    sections = {
--        lualine_x = {getWords, 'encoding', 'fileformat', 'filetype'},
        lualine_x = {getWords, 'encoding', 'filetype'},
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
        "vim",
        "regex",
        "bash",
        "markdown",
        "markdown_inline",
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
local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require('cmp')
local lspkind = require('lspkind')
require("luasnip.loaders.from_lua").lazy_load { paths = "~/.config/nvim/snippets" }

cmp.setup {
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            ellipsis_char = '...',
            before = function(entry, vim_item)
                vim_item.menu = ({
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        --                    ultisnips = "[UltiSnips]",
                        luasnip = "[Luasnip]",
                        nvim_lua = "[Lua]",
                        look = "[Look]",
                        path = "[Path]",
                        spell = "[Spell]",
                        cmp_tabnine = "[TabNine]",
                        pandoc_references = "[Citation]",
--                        skkeleton = "[SKK]"
                        --                cmp_pandoc = "[Pandoc]"
                    })[entry.source.name]
                return vim_item
            end
        }),
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
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
--        ['<Tab>'] = function(fallback)
--            if cmp.visible() then
--                cmp.select_next_item()
--            else
--                fallback()
--            end
--        end,
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- they way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable( -1) then
                luasnip.jump( -1)
            else
                fallback()
            end
        end, { "i", "s" })
    },
    sources = {
        { name = 'buffer' },
        { name = 'nvim_lsp' },
        --       { name = 'ultisnips' },
        { name = 'luasnip' },
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
        { name = 'pandoc_references' },
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

-- Whichkey
local wk = require('which-key')
wk.register({
    ["<leader>tv"] = 'Toggle vertical terminal',
    ["<leader>td"] = 'Toggle horizontal terminal',
    ["<leader>rr"] = 'Toggle R vertically',
    ["<leader>rd"] = 'Toggle R horizontally',
    ["<leader>ff"] = 'Send current line in R',
    ["<leader>fa"] = 'Send visual lines in R',
    ["<leader>se"] = 'Open the sessions list',
    ["<leader>sq"] = 'Save and close the session',
    ["<leader>bz"] = 'Fuzzy search buffers',
    ["<leader>fz"] = 'Fuzzy search files',
    ["<leader>tt"] = 'Markdown Table',
    ["K"] = 'lsp hover',
    ["gf"] = 'lsp formatting',
    ["]d"] = 'lsp diagnostic goto',
    ["[d"] = 'lsp diagnostic goto',
    ["]e"] = 'lsp goto ERROR',
    ["[e"] = 'lsp goto ERROR',
    ["]w"] = 'lsp goto WARN',
    ["[w"] = 'lsp goto WARN',
    ["]i"] = 'lsp goto INFO',
    ["[i"] = 'lsp goto INFO ',
    ["]h"] = 'lsp goto HINT ',
    ["[h"] = 'lsp goto HINT',
})

--notice
require("noice").setup({
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },
    -- you can enable a preset for easier configuration
    presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
    },
})
