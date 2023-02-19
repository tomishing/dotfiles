-- Disable some builtin vim plugins
local g = vim.g
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

-- option settings

local options = {
   autochdir = true,
   autoindent = true,
   clipboard = 'unnamedplus',
   completeopt = { 'menu', 'menuone', 'noselect' },
   cursorline = true,
   expandtab = true,
   foldcolumn = '1',
   foldlevel = 1,
   hls = true,
   ignorecase = true,
   incsearch = true,
   linebreak = true,
   list = false,
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
   termguicolors = true,
   wrap = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
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


--append
vim.opt.iskeyword:append("-")
