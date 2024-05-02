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
                        luasnip = "[Luasnip]",
                        nvim_lua = "[Lua]",
                        look = "[Look]",
                        path = "[Path]",
                        spell = "[Spell]",
                        pandoc_references = "[Citation]",
--                        skkeleton = "[SKK]",
                    })[entry.source.name]
                return vim_item
            end
        }),
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
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
    }),
    sources = cmp.config.sources({
        { name = 'buffer' },
        { name = 'nvim_lsp' },
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
        { name = 'spell',
            option = {
                keep_all_entries = false,
                enable_in_context = function()
                    return true
                end,
            },
        },
        { name = 'pandoc_references' },
        { name = 'otter' },
        { name = 'emoji' },
        { name = 'treesitter', keyword_length = 5, max_item_count = 3 },
--        { name = 'skkeleton' },
    }),
}

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources(
        { { name = 'cmp_git' }, },
        { { name = 'buffer' }, }
    )
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', { sources = { { name = 'buffer' } } })
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline(':', {
--    sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
--})
 cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

--Disable all sources but skkeleton when writing Japanese.
--local def_sources = cmp.config.sources({
--    { name = 'buffer' },
--    { name = 'nvim_lsp' },
--    { name = 'luasnip' },
--    { name = 'nvim_lua' },
--    {
--        name = 'look',
--        keyword_length = 2,
--        option = {
--            convert_case = true,
--            loud = true
--        }
--    },
--    { name = 'path' },
--    { name = 'spell' },
--    { name = 'pandoc_references' },
--})
--local jpn_sources = cmp.config.sources({
--    { name = 'skkeleton' },
--})
--
--local augroup = vim.api.nvim_create_augroup
--local autocmd = vim.api.nvim_create_autocmd
--
--augroup('skkeleton', { clear = true })
--autocmd(
--    'User',
--    {
--        group = 'skkeleton',
--        pattern = 'skkeleton-enable-pre',
--        callback = function()
--            cmp.setup.buffer { sources = jpn_sources }
--        end,
--    }
--)
--autocmd(
--    'User',
--    {
--        group = 'skkeleton',
----        pattern = 'skkeleton-disable-post',
--        pattern = 'skkeleton-disable-pre',
--        callback = function()
--            cmp.setup.buffer { sources = def_sources }
--        end,
--    }
--)
