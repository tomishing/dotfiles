
" plugins

call plug#begin('~/.config/nvim/plugged')
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
Plug 'EdenEast/nightfox.nvim'
"proofreading
Plug 'preservim/vim-wordy' 
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim' "for git
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive' "for git
Plug 'psliwka/vim-smoothie' 
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'voldikss/vim-browser-search'
Plug 'justinmk/vim-sneak'
Plug 'kyazdani42/nvim-tree.lua'
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
Plug 'lukas-reineke/indent-blankline.nvim'
"Scroll bar
Plug 'petertriho/nvim-scrollbar'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}
Plug 'lambdalisue/readablefold.vim'
"pandoc syntax for markdown
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-pandoc/vim-pandoc-syntax'
call plug#end()

"load lua/config.lua
lua require("base-opt")
lua require('config')
lua require('keymap')

"Markdown folding
"let g:markdown_folding = 1

"color scheme
"colorscheme nordfox
"hi vertsplit guifg=grey 

"settings for snippets
"let g:UltiSnipsDirectories=[$HOME,'/.config/nvim/UltiSnips']
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"let g:UltiSnipsEditSplit="vertical"
"let g:deoplete#enable_at_startup = 1

" settings for terminal
"autocmd TermOpen * startinsert

"setting for search over dictionary.com
"\saw is going to look for a word under the cursor
"nmap <silent> <Leader>s <Plug>SearchNormal
"vmap <silent> <Leader>s <Plug>SearchVisual

"let g:browser_search_engines = {
"			\ 'dictionary.com': 'https://www.dictionary.com/browse/%s',
"			\ 'cambridge': 'https://dictionary.cambridge.org/us/dictionary/english-japanese/%s'}
"let g:browser_search_default_engine = 'cambridge'

"vim-sneak
"s with two words: search forward
"S with two words: search backward
"use cl instead of s
"use cc instead of S
"let g:sneak#label = 1

"skkeleton settings
"call skkeleton#config({ 'globalJisyo': '~/.config/skk/SKK-JISYO.L' })
"call skkeleton#config({ 'userJisyo': '~/.config/skk/user.dic' })
"call skkeleton#config({ 'eggLikeNewline':v:true })
"call skkeleton#config({ 'useSkkServer':v:true })

"call skkeleton#register_kanatable('rom', {
"      \ 'jj': 'escape',
"      \ 'z,': ['―'],
"      \ })

"imap <C-j> <Plug>(skkeleton-enable)
"cmap <C-j> <Plug>(skkeleton-enable)
"imap jz <Plug>(skkeleton-toggle)
"cmap jz <Plug>(skkeleton-toggle)

"fzf_session setting
"let g:fzf_session_path = $HOME . '/.config/nvim/session'

