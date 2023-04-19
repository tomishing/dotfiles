-- Disable some builtin vim plugins
local g = vim.g
local o = vim.opt
local bo = vim.bo

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
  "syntax_completion",
  "spellfile_plugin",
  "sql_completion",
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end

g.did_install_default_menus = 1
g.did_install_syntax_menu = 1
g.netrw_liststyle = 3

-- option settings

local options = {
   autochdir = true,
   autoindent = true,
--   autowriteall = true,
--   clipboard = 'unnamedplus',
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
--   spell = false,
   spelllang = { 'en_us', 'cjk' },
   splitbelow = true,
   splitright = true,
   tabstop = 4,
   termguicolors = true,
   wrap = true,
   laststatus = 3,
}

for k, v in pairs(options) do
    o[k] = v
end

-- spellcheck

--if bo.filetype == 'markdown' then
--   o.spell = true
--else
--   o.spell = false
--end

--append
o.iskeyword:append({'-'})
o.clipboard:append({'unnamedplus'})

-- vertical and horizontal line settings
o.fillchars = {
--  horiz = '━',
--  horizup = '┻',
--  horizdown = '┳',
--  vert = '┃',
--  vertleft  = '┫',
--  vertright = '┣',
--  verthoriz = '╋',
  horiz = '─',
  horizup = '┴',
  horizdown = '┬',
  vert = '│',
  vertleft  = '┤',
  vertright = '├',
  verthoriz = '┼',
}

