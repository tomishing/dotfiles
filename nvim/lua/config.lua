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
--fn['skkeleton#config']({
--    globalJisyo = '~/.config/skk/SKK-JISYO.L',
--    userJisyo = '~/.config/skk/user.dic',
--    eggLikeNewline = true
--})
--fn['skkeleton#register_kanatable']('rom', {
--    ['z,'] = { '―', '' },
--    ['/'] = { '・', ''},
--    ['('] = {'（', ''},
--    [')'] = {'）', ''},
--    ['jj'] = 'escape',
--})

-- toggleterm setup
require("toggleterm").setup{
    start_in_insert = true,
    persist_mode = false,
}

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
local function luax(wordc)
    local a
    if wordc ~= nil then
        a = {wordc, 'encoding', 'filetype'}
    else
        a = {'encoding', 'filetype', 'fileformat'}
    end
    return a
end

require('lualine').setup {
    options = {
        theme = 'auto',
        -- globalstatus = true,
    },
    sections = {
--        lualine_x = {getWords, 'encoding', 'filetype'},
        lualine_x = luax(getWords)
    },
}

--- gitsigns

require('gitsigns').setup()

--- plenary settings
--local async = require('plenary.async')

--- treesitter

require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "r",
        "json",
        "python",
        "lua",
        "html",
        "css",
        "yaml",
        "vim",
        "regex",
        "bash",
        "markdown",
        "markdown_inline",
        "javascript",
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
local servers = { 'r_language_server', 'pyright', 'lua_ls', 'sqlls', 'vimls', 'html', 'marksman', 'yamlls',}

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

-- null-ls, formatter
local null_ls = require('null-ls')
local b = null_ls.builtins

null_ls.setup({
    sources = {
        b.formatting.black,
        b.formatting.prettierd.with { filetype = {
            "html", "yaml", "markdown", "css", "scss" }
        },
    }
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
-- require('quarto').setup(),
})

-- require('live-preview').setup()
require('telescope').load_extension('possession')
