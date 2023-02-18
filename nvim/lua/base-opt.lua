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

-- vertical and horizontal line settings
vim.opt.fillchars = {
  horiz = '━',
  horizup = '┻',
  horizdown = '┳',
  vert = '┃',
  vertleft  = '┫',
  vertright = '┣',
  verthoriz = '╋',
}

-- settings 
-- vim.opt.spell = false
-- vim.opt.spelllang = { 'en_us', 'cjk' }

-- better autocompletion experience
-- vim.o.completeopt = 'menu,menuone,noselect'

local options = {
   autochdir = true,
   autoindent = true,
   completeopt = { 'menu', 'menuone', 'noselect' },
   cursorline = true,
   expandtab = true,
   hls = true,
   ignorecase = true,
   incsearch = true,
   mouse = 'a',
   number = true,
   relativenumber = true,
   ruler = true,
   shiftwidth = 4,
   showmatch = true,
   smartcase = true,
   smartindent = true,
   spell = false,
   spelllang = { 'en_us', 'cjk' },
   splitbelow = true,
   splitright = true,
   tabstop = 4,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
