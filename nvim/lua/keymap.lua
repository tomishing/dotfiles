--keymaps

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

--jk <ESC>
map({ 'i' }, 'jk', '<esc>', { silent = true })
map('i', 'ｊｋ', '<ESC>')
map('n', 'い', 'i')
map('i', '：ｗ', ':w')

--nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)
map('n', '<leader>n', ':NvimTreeFindFile<CR>', opts)

--search over dictionary.com
map('n', '<Leader>s', '<Plug>SearchNormal', { silent = true} )
map('v', '<Leader>s', '<Plug>SearchVisual', { silent = true} )

