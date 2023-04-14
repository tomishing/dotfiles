local fn = vim.fn
local bo = vim.bo
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
            if bo.modified and not bo.readonly and fn.expand("%") ~= "" and bo.buftype == "" then
                vim.api.nvim_command('silent update')
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
            vim.wo.spell = true
        end,
    }
)