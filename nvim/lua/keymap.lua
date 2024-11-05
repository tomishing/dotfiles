--keymaps

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

--jk <ESC>
map({ "i" }, "jk", "<esc>", { silent = true })
map("i", "ｊｋ", "<esc>")
map("n", "い", "i")
map("i", "：ｗ", ":w")

-- nvim-tree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", opts)
-- map("n", "<leader>r", "<cmd>NvimTreeRefresh<CR>", opts)
-- due to key map conflict
map("n", "<leader>n", "<cmd>NvimTreeFindFile<CR>", opts)

-- fzf
map("n", "<leader>bz", "<cmd>Buffers<CR>", opts)
map("n", "<leader>fz", "<cmd>Files<CR>", opts)

-- session
map("n", "<leader>de", "<cmd>Sessions<CR>", opts)
map("n", "<leader>dq", "<cmd>SQuit<CR>", opts)

-- automatic insert a matching brace
map("i", "{", "{}<esc>ha")
map("i", "[", "[]<esc>ha")
map("i", "(", "()<esc>ha")
map("i", '"', '""<esc>ha')
-- map('i', '<', '<><esc>ha')

-- settings for skkeleton
--map("i", "jz", "<Plug>(skkeleton-toggle)", { silent = true })
--map("c", "jz", "<Plug>(skkeleton-toggle)", { silent = true })

-- in case you want to disable/enable nvim-cmp by keymap.
--map("n", "<leader>jz", "<cmd>lua require('cmp').setup.buffer({ enabled = false })<CR>", opts)
--map("n", "<leader>cm", "<cmd>lua require('cmp').setup.buffer({ enabled = true })<CR>", opts)

-- switch to another terminal or panes
local topts = {noremap = true}
map("t", "<esc>", [[ <C-\><C-n> ]], topts)
map("t", "<A-h>", [[ <C-\><C-n><C-w>h ]], topts)
map("t", "<A-j>", [[ <C-\><C-n><C-w>j ]], topts)
map("t", "<A-k>", [[ <C-\><C-n><C-w>k ]], topts)
map("t", "<A-l>", [[ <C-\><C-n><C-w>l ]], topts)
map("i", "<A-h>", [[ <C-\><C-n><C-w>h ]], { noremap = true })
map("i", "<A-j>", [[ <C-\><C-n><C-w>j ]], { noremap = true })
map("i", "<A-k>", [[ <C-\><C-n><C-w>k ]], { noremap = true })
map("i", "<A-l>", [[ <C-\><C-n><C-w>l ]], { noremap = true })
map("n", "<A-h>", "<C-w>h", { noremap = true })
map("n", "<A-j>", "<C-w>j", { noremap = true })
map("n", "<A-k>", "<C-w>k", { noremap = true })
map("n", "<A-l>", "<C-w>l", { noremap = true })

-- tabpage: switch to another tab page
map("n", "<leader>ta", "<cmd>tabnew<CR>", opts)
map("v", "<leader>ta", "<cmd>tabnew<CR>", opts)
map("n", "<leader>tc", "<cmd>tabclose<CR>", opts)
map("v", "<leader>tc", "<cmd>tabclose<CR>", opts)
map("n", "]t", "<cmd>+tabnext<CR>", opts)
map("v", "]t", "<cmd>+tabnext<CR>", opts)
map("n", "[t", "<cmd>-tabnext<CR>", opts)
map("v", "[t", "<cmd>-tabnext<CR>", opts)

-- toggleterm settings and R
map("n", "<leader>tv", "<cmd>ToggleTerm size=75 direction=vertical<CR>", { noremap = true })
map("n", "<leader>td", "<cmd>ToggleTerm size=15 direction=horizontal<CR>", { noremap = true })
map("n", "<leader>2td", "<cmd>2ToggleTerm size=15 direction=horizontal<CR>", { noremap = true })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { noremap = true })
map("n", "<leader>rr", '<cmd>TermExec size=75 direction=vertical cmd="R"<CR>', { noremap = true })
map("n", "<leader>rd", '<cmd>TermExec size=25 direction=horizontal cmd="R"<CR>', { noremap = true })
map("n", "<leader>ff", "<cmd>ToggleTermSendCurrentLine<CR>", opts)
map("v", "<leader>fa", ":ToggleTermSendVisualLines<CR>", opts)
map("n", "<leader>2ff", "<cmd>ToggleTermSendCurrentLine 2<CR>", opts)
map("v", "<leader>2fa", ":ToggleTermSendVisualLines 2<CR>", opts)
--map({"n", "t"}, "<leader>tc", "<cmd>ToggleTermToggleAll!<CR>", opts)

-- hlsens

map("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
map("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
map("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], opts)
map("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], opts)
map("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], opts)
map("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], opts)

-- highlight
map("n", "<Leader>l", "<cmd>noh<CR>", opts)

-- Quarto
-- map('n', '<leader>qp', quarto.quartoPreview, { silent = true, noremap = true })

-- lsp
local M = {} -- This is module in lua

local lbuf = vim.lsp.buf
local dia = vim.diagnostic

function M.diagnostic_goto(next, severity)
    local go = next and dia.goto_next or dia.goto_prev
    severity = severity and dia.severity[severity] or nil
    return function()
        go({ severity = severity })
    end
end

map("n", "K", lbuf.hover, opts)
--map("n", "gf", lbuf.formatting, opts)
--map("v", "gf", lbuf.formatting, opts)
map("n", "gf", lbuf.format, opts)
map("v", "gf", lbuf.format, opts)
map("n", "gr", lbuf.references, opts)
map("n", "gd", lbuf.definition, opts)
map("n", "gD", lbuf.declaration, opts)
map("n", "gi", lbuf.implementation, opts)
-- map("n", "gt", lbuf.type_definition, opts)
map("n", "gn", lbuf.rename, opts)
map("n", "ga", lbuf.code_action, opts)
map("n", "ge", dia.open_float, opts)
map("n", "]d", M.diagnostic_goto(true), opts)
map("n", "[d", M.diagnostic_goto(false), opts)
map("n", "]e", M.diagnostic_goto(true, "ERROR"), opts)
map("n", "[e", M.diagnostic_goto(false, "ERROR"), opts)
map("n", "]w", M.diagnostic_goto(true, "WARN"), opts)
map("n", "[w", M.diagnostic_goto(false, "WARN"), opts)
map("n", "]i", M.diagnostic_goto(true, "INFO"), opts)
map("n", "[i", M.diagnostic_goto(false, "INFO"), opts)
map("n", "]h", M.diagnostic_goto(true, "HINT"), opts)
map("n", "[h", M.diagnostic_goto(false, "HINH"), opts)

return M
