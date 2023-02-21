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

--fzf
map('n', '<leader>bz', ':Buffers<CR>', opts)
map('n', '<leader>fz', ':Files<CR>', opts)

--automatic insert a matching brace
map('i', '{', '{}<esc>ha')
map('i', '[', '[]<esc>ha')
map('i', '(', '()<esc>ha')
map('i', '"', '""<esc>ha')

--settings for skkeleton
map('i', 'jz', '<Plug>(skkeleton-toggle)', { silent = true} )
map('c', 'jz', '<Plug>(skkeleton-toggle)', { silent = true} )


