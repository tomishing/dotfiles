--keymaps

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

--jk <ESC>
map({ 'i' }, 'jk', '<esc>', { silent = true })
map('i', 'ｊｋ', '<esc>')
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
map('i', '<', '<><esc>ha')

--settings for skkeleton
map('i', 'jz', '<Plug>(skkeleton-toggle)', { silent = true} )
map('c', 'jz', '<Plug>(skkeleton-toggle)', { silent = true} )

-- terminal and panes
map('t', '<esc>', [[ <C-\><C-n> ]], { noremap = true })
map('t', '<A-h>', [[ <C-\><C-n><C-w>h ]], { noremap = true })
map('t', '<A-j>', [[ <C-\><C-n><C-w>j  ]], { noremap = true })
map('t', '<A-k>', [[ <C-\><C-n><C-w>k  ]], { noremap = true })
map('t', '<A-l>', [[ <C-\><C-n><C-w>l  ]], { noremap = true })
map('i', '<A-h>', [[ <C-\><C-n><C-w>h ]], { noremap = true })
map('i', '<A-j>', [[ <C-\><C-n><C-w>j  ]], { noremap = true })
map('i', '<A-k>', [[ <C-\><C-n><C-w>k  ]], { noremap = true })
map('i', '<A-l>', [[ <C-\><C-n><C-w>l  ]], { noremap = true })
map('n', '<A-h>', '<C-w>h', { noremap = true })
map('n', '<A-j>', '<C-w>j', { noremap = true })
map('n', '<A-k>', '<C-w>k', { noremap = true })
map('n', '<A-l>', '<C-w>l', { noremap = true })

-- toggleterm settings and R
map('n', '<leader>tt', ':ToggleTerm size=75 direction=vertical<CR>', { noremap = true })
map('n', '<leader>td', ':ToggleTerm size=25 direction=horizontal<CR>', { noremap = true })
map('n', '<leader>rr', ':TermExec size=75 direction=vertical cmd="R"<CR>', { noremap = true })
map('n', '<leader>rd', ':TermExec size=25 direction=horizontal cmd="R"<CR>', { noremap = true })
map('n', '<leader>ff', ':ToggleTermSendCurrentLine 1<CR>', { noremap = true })
map('v', '<leader>fa', ':ToggleTermSendVisualLines 1<CR>', { noremap = true })

