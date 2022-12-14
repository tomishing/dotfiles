local g = vim.g
-- Disable some builtin vim plugins
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "matchparen",
  "tar",
  "tarPlugin",
  "rrhelper",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end

-- publicly shared in github
-- toggleterm setup
require("toggleterm").setup{}
--- lualineO
-- theme: eg. papercolor_dark
require('lualine').setup {
    options = { theme = 'auto' }
    }

--- gitsigns

require('gitsigns').setup()

--- plenary settings

local async = require('plenary.async')

--- treesitter

require('nvim-treesitter.configs').setup {
  ensure_installed = {
	  "r",
--	  "markdown",
	  "json",
	  "python",
	  "lua",
	  "html",
	  "yaml"
	  },
  highlight = { enable = true, },
}

--- scrollbar settings for scrollbar and hlslens

require('scrollbar').setup()
--require('scrollbar.handlers.search').setup()

local kopts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

vim.api.nvim_set_keymap('n', '<Leader>l', ':noh<CR>', kopts)

--- nvim-tree

require('nvim-tree').setup { -- BEGIN_DEFAULT_OPTS
--  auto_close = false,
  auto_reload_on_write = true,
  disable_netrw = false,
--  hide_root_folder = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  view = {
    width = 30,
    height = 30,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = nil,
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "???",
      info = "???",
      warning = "???",
      error = "???",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      git = false,
    },
  },
} -- END_DEFAULT_OPTS

-- Setup nvim-cmp.
local cmp = require('cmp')
local lspkind = require('lspkind')

-- better autocompletion experience
vim.o.completeopt = 'menu,menuone,noselect'

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
                skkeleton = "[Skk]"
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
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },

    mapping = {
        -- Use Tab and shift-Tab to navigate autocomplete menu
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
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
        { name = 'skkeleton' },
    },

}

vim.opt.spell = false
vim.opt.spelllang = { 'en_us', 'cjk' }

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
  { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
}, {
  { name = 'buffer' },
})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
sources = {
  { name = 'buffer' }
}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
sources = cmp.config.sources({
  { name = 'path' }
}, {
  { name = 'cmdline' }
})
})


-- lsp-server settings: mason, and mason-lspconfig
-- So far, lint is working well without this packages, these are ommited.
require("mason").setup({
      ui = {
            icons = {
                package_installed = "???",
                package_pending = "???",
                package_uninstalled = "???"
            }
        }
})
require("mason-lspconfig").setup()

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
local nvim_lsp = require('lspconfig')
local servers = {'r_language_server', 'pyright'}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        capabilities = capabilities
    }
end
-- require('lspconfig')['r_language_server', 'pyright'].setup {
-- capabilities = capabilities
-- }

-- diagnostic settings
vim.diagnostic.config {
    virtual_text = false,
    signs = true,
    underline = false,
    update_in_insert = true,
}

-- cmp_pandoc settings
-- require('cmp_pandoc').setup()

-- tabnine settings

local tabnine = require('cmp_tabnine.config')
tabnine:setup({
	max_lines = 1000;
	max_num_results = 20;
	sort = true;
	run_on_every_keystroke = true;
	snippet_placeholder = '..';
	ignored_file_types = { -- default is not to ignore
		-- uncomment to ignore in lua:
		-- lua = true
	};
})

-- indent-blankline settings
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}


