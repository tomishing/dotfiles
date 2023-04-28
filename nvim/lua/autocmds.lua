local fn = vim.fn
local bo = vim.bo
local wo = vim.wo
local api = vim.api
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- terminal
autocmd(
    { 'TermOpen' },
    { pattern = '*', command = 'startinsert', }
)

-- auto write
augroup('AutoSave', { clear = true } )
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

-- spellcheck
augroup('Spell', { clear = true } )
autocmd(
    'FileType',
    {
        group = 'Spell',
        pattern = { 'markdown', 'html', 'gitcommit' },
--        command = 'setlocal spell'
        callback = function()
            wo.spell = true
        end,
    }
)

-- When skkeleton is enabled, disable nvim-cmp. 
-- Somehow, nvim-cmp got to be unable to handle utf-8 as of Apr 25.
-- Until yesterday, it worked smooth as silk. 

--augroup('skkeleton', { clear = true })
--autocmd(
--    'User',
--    {
--        group = 'skkeleton',
--        pattern = 'skkeleton-enable-pre',
--        callback = function()
--            require('cmp').setup.buffer { enabled = false }
--        end,
--    }
--)
--autocmd(
--    'User',
--    {
--        group = 'skkeleton',
--        pattern = 'skkeleton-disable-post',
----        pattern = 'skkeleton-disable-pre',
--        callback = function()
--            require('cmp').setup.buffer { enabled = true }
--        end,
--    }
--)
