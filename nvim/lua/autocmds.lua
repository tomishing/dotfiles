local fn = vim.fn
local bo = vim.bo
local wo = vim.wo
local api = vim.api
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local opt = { clear = true }
local toggleterm_pattern = { "term://*#toggleterm#*", "term://*::toggleterm::*" }
local cmd = vim.cmd
-- terminal
autocmd(
    { 'TermOpen' },
    {
        pattern = '*',
        command = 'startinsert',
    }
)
cmd([[autocmd TermOpen * setlocal nocursorline | set nocursorcolumn]])

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
        command = 'setlocal spell'
    }
)

