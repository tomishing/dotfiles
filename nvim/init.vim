"set number
"set clipboard+=unnamedplus
"set hls
"set ignorecase
"set incsearch
"set smartcase
"set smartindent
"set ruler
"set showmatch
"set list
"set wrap linebreak nolist
"set autoindent
"set iskeyword+=-
"set cursorline
" spell check
" if you want to disable spell check, type :set nospell on command mode.
" set spell "if you want to able this at default.
"set spelllang=en_us,cjk
"set spellsuggest=best,9
"set tabstop=4
"set shiftwidth=4
"set expandtab
"set splitbelow
"set splitright
"set mouse=a
"set autochdir

" plugins

call plug#begin('~/.config/nvim/plugged')
""Plug 'nathom/filetype.nvim'
Plug 'iamcco/markdown-preview.nvim' 
Plug 'rhysd/vim-grammarous' 
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dominickng/fzf-session.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"colorscheme
""Plug 'ayu-theme/ayu-vim' 
""Plug 'cormacrelf/vim-colors-github'
Plug 'EdenEast/nightfox.nvim'
"proofreading
Plug 'preservim/vim-wordy' 
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'deathlyfrantic/deoplete-spell'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim' "for git
"Plug 'vim-pandoc/vim-pandoc' "for markdown
"Plug 'vim-pandoc/vim-pandoc-syntax' "for markdown
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive' "for git
Plug 'psliwka/vim-smoothie' 
"Plug 'kdheepak/lazygit.nvim' "for git
Plug 'nvim-lualine/lualine.nvim'
"Plug 'feline-nvim/feline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'voldikss/vim-browser-search'
Plug 'justinmk/vim-sneak'
Plug 'kyazdani42/nvim-tree.lua'
"Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }
""""Setup nvim-cmp
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'f3fora/cmp-spell'
Plug 'octaltree/cmp-look'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'onsails/lspkind-nvim'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'jc-doyle/cmp-pandoc-references'
Plug 'vim-skk/skkeleton'
"SKk
Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'
"Plug 'rinx/cmp-skkeleton'
"REPL (a read-eval-print loop)
"Plug 'jpalardy/vim-slime'
Plug 'lukas-reineke/indent-blankline.nvim'
"Scroll bar
Plug 'petertriho/nvim-scrollbar'
Plug 'kevinhwang91/nvim-hlslens'
"Markdown table
Plug 'dhruvasagar/vim-table-mode'
"Plug 'aspeddro/cmp-pandoc.nvim' does not work.
"Plug 'nvim-lua/popup.nvim' "useless
"Plug 'nvim-telescope/telescope.nvim' "fzf is better and faster
"Plug 'nvim-telescope/telescope-media-files.nvim' "I do not want to see pdf or
"other images from nvim.
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}
Plug 'lambdalisue/readablefold.vim'
call plug#end()

"load lua/config.lua
lua require('config')
lua require('keymap')

"keybindings for switching to normal mode
"inoremap jk <Esc>

"settings for Japanese input (with enter)
"inoremap ｊｋ <Esc>
"nnoremap い i
"nnoremap ：ｗ :w

"settings for folding
"set foldlevel=1
"set foldcolumn=0

"Markdown folding
let g:markdown_folding = 1

"color scheme
"ayu
"set termguicolors     " enable true colors support
""let ayucolor="mirage" " for mirage version of theme
""colorscheme ayu
""set background=dark
""colorscheme github
colorscheme nordfox

hi vertsplit guifg=grey 

"settings for snippets
let g:UltiSnipsDirectories=[$HOME,'/.config/nvim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:deoplete#enable_at_startup = 1

" settings for terminal
tnoremap <Esc> <C-\><C-n>
autocmd TermOpen * startinsert

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


" setting for automatic insert a matching brace
""inoremap { {}<Esc>ha
""inoremap [ []<Esc>ha
""inoremap ( ()<Esc>ha
""inoremap " ""<Esc>ha
"inoremap ' ''<Esc>ha

"disable folding in vim-pandoc
"let g:pandoc#modules#disabled=["folding"]

" setting for bibliographies in vim-pandoc

"let g:pandoc#biblio#bibs=['/home/tomishing/Dropbox/zotero/MyLibrary.bib'] 
"call deoplete#custom#var('omni', 'input_patterns', {
"  \ 'pandoc': '@\w{,12}'
"  \})

" mapleader

""let mapleader=" "

"setting for lazygit
"let g:lazygit_floating_window_winblend = 1 " transparency of floating window
"let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
"let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
"let g:lazygit_floating_window_use_plenary = 1 " use plenary.nvim to manage floating window if available
"let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed

"setting for search over dictionary.com
"\saw is going to look for a word under the cursor
"nmap <silent> <Leader>s <Plug>SearchNormal
"vmap <silent> <Leader>s <Plug>SearchVisual

let g:browser_search_engines = {
			\ 'dictionary.com': 'https://www.dictionary.com/browse/%s'
			\ }
let g:browser_search_default_engine = 'dictionary.com'

"vim-sneak
"s with two words: search forward
"S with two words: search backward
"use cl instead of s
"use cc instead of S
let g:sneak#label = 1

"nvim-tree keybindings
"nnoremap <C-n> :NvimTreeToggle<CR>
"nnoremap <leader>r :NvimTreeRefresh<CR>
"nnoremap <leader>n :NvimTreeFindFile<CR>

"eskk settings: SKK dictionary
"let g:eskk#directory = "~/.config/skk"
"let g:eskk#dictionary = { 'path': "~/.config/skk/user.dic", 'sorted': 1, 'encoding': 'utf-8',}
"let g:eskk#large_dictionary = {'path': "~/.config/skk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp',}

"skkeleton settings
call skkeleton#config({ 'globalJisyo': '~/.config/skk/SKK-JISYO.L' })
call skkeleton#config({ 'userJisyo': '~/.config/skk/user.dic' })
call skkeleton#config({ 'eggLikeNewline':v:true })
"call skkeleton#config({ 'useSkkServer':v:true })

call skkeleton#register_kanatable('rom', {
      \ 'jj': 'escape',
      \ 'z,': ['―'],
      \ })

"imap <C-j> <Plug>(skkeleton-enable)
"cmap <C-j> <Plug>(skkeleton-enable)
"imap jz <Plug>(skkeleton-toggle)
"cmap jz <Plug>(skkeleton-toggle)

"vim-slime settings
"let g:slime_target = "neovim"
"let g:slime_no_mappings = 1

"Slime setting: To terminal 
"nmap <C-c><C-c> <Plug>SlimeParagraphSend 
"xmap <C-c><C-c> <Plug>SlimeRegionSend
"nmap <C-c>v     <Plug>SlimeConfig
"To R
"nmap <leader>f <Plug>SlimeLineSend 

"fun! StartREPL(repl)
"  execute 'terminal '.a:repl
"  setlocal nonumber
"  let t:term_id = b:terminal_job_id
"  wincmd p
"  execute 'let b:slime_config = {"jobid": "'.t:term_id . '"}'
"endfun

"for R
"noremap <leader>rr :vsplit<bar>:call StartREPL('R')<CR><ESC>
"for sql
"noremap <leader>qq :vsplit<bar>:call StartREPL('')<CR><ESC>

"fzf_session setting
let g:fzf_session_path = $HOME . '/.config/nvim/session'

"markdown table
"in command mode, :TableModeToggle
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'


"toggleterm settings
"and R
nnoremap <leader>tt :ToggleTerm size=75 direction=vertical<CR>
nnoremap <leader>td :ToggleTerm size=25 direction=horizontal<CR>
nnoremap <leader>rr :TermExec size=75 direction=vertical cmd="R"<CR>
nnoremap <leader>rd :TermExec size=25 direction=horizontal cmd="R"<CR>
nnoremap <leader>ff :ToggleTermSendCurrentLine 1<CR>
vnoremap <leader>fa :ToggleTermSendVisualLines 1<CR>
