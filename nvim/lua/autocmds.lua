local fn = vim.fn
local bo = vim.bo
local wo = vim.wo
local api = vim.api
local ol = vim.opt_local
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local opt = { clear = true }

-- auto write
augroup('AutoSave', opt )
autocmd(
    { 'BufLeave', 'FocusLost' },
    {
        group = 'AutoSave',
        callback = function()
            if bo.modified and not bo.readonly and
            fn.expand("%") ~= "" and bo.buftype == "" then
                api.nvim_command('silent update')
            end
        end,
    }
)

-- spellcheck and soft wrapping for text files
augroup('Spell', opt )
autocmd(
    'FileType',
    {
        group = 'Spell',
        pattern = { 'markdown', 'html', 'gitcommit', 'mail' },
--        command = 'setlocal spell'
        callback = function()
            ol.wrap = true
            ol.tw = 0
            ol.spell = true
            ol.linebreak = true
        end,
    }
)

-- resize splits if window got resized
augroup('Resize', opt)
autocmd(
    'VimResized',
    {
        group = 'Resize',
        command = 'tabdo wincmd =',
    }
)

-- terminal and toggleterm settings
-- local cmd = vim.cmd
-- local toggleterm_pattern = { "term://*#toggleterm#*", "term://*::toggleterm::*" }
--augroup('terminal', opt)
--autocmd(
--    'BufEnter',
--    {
--        group = 'terminal',
--        pattern = toggleterm_pattern,
--        command = 'startinsert',
--    }
--)

-- settings for terminal, and it is not needed for toggleterm.
--autocmd(
--    { 'TermOpen' },
--    {
--        pattern = '*',
--        command = 'startinsert',
--    }
--)

-- settings proposed by the author
--autocmd(
--    'BufEnter',
--    {
--        group = 'terminal',
--        pattern = '*',
--        callback = function()
--            if bo.buftype == 'terminal' then
--                api.nvim_command('startinsert')
--            end
--        end,
--    }
--)

