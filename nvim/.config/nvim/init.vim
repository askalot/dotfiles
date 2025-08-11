call plug#begin()

Plug 'windwp/nvim-autopairs'
Plug 'saghen/blink.cmp'
Plug 'akinsho/bufferline.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'xiyaowong/transparent.nvim'
Plug 'tpope/vim-commentary'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'folke/noice.nvim'
Plug 'nvim-lua/telescope.nvim', { 'tag': '0.1.x' }
Plug 'nvzone/showkeys'
Plug 'sphamba/smear-cursor.nvim'
Plug 'wuelnerdotexe/vim-astro'
Plug 'wuelnerdotexe/vim-enfocado'
" Plug 'nvzone/volt'
" Plug 'nvzone/timerly'
" Plug 'nvzone/floaterm'
" Plug 'nvzone/typr'

call plug#end()

" Map <Space> as <Leader>
let mapleader = ' '

" Autocomplete
lua << EOF
require('nvim-autopairs').setup()
require('blink.cmp').setup()
EOF

" Buffers
nnoremap <Leader>t :enew<CR>
nnoremap <Leader>x :bdelete<CR>
nnoremap <Leader>` :buffer #<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>
nnoremap ]b :bnext<CR>
nnoremap [b :bprevious<CR>

lua << EOF
require('bufferline').setup()
EOF

" Colours
set background=dark
colorscheme onedark
" let g:enfocado_style = 'neon' " Available: `nature` or `neon`.
" colorscheme enfocado
" colorscheme enfocado
lua << EOF
require('transparent').setup({
	extra_groups = {
		"NvimTreeNormal",
	},
})
EOF

" Commands
nnoremap ; :
" nnoremap ;; ;
" map ; :
lua << EOF
require('noice').setup()
EOF

" Comments
nnoremap <Leader>/ :Commentary<CR>
vnoremap <Leader>/ :Commentary<CR>

" Config
nnoremap <Leader>ec :edit $MYVIMRC<CR>
nnoremap <Leader>sc :source $MYVIMRC<CR>

" Editing
" Move lines up or down
nnoremap <A-Down> :move .+1<CR>==
inoremap <A-Down> <Esc>:move .+1<CR>==gi
vnoremap <A-Down> :move '>+1<CR>gv=gv
nnoremap <A-Up> :move .-2<CR>==
inoremap <A-Up> <Esc>:move .-2<CR>==gi
vnoremap <A-Up> :move '<-2<CR>gv=gv
" Delete to black hole register
nnoremap <Leader>d "_d
nnoremap <Leader>d "_d
vnoremap <Leader>dd "_dd
" Paste from system clipboard
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p
" Copy to system clipboard
nnoremap <Leader>y "+y
vnoremap <Leader>y "+ygv
nnoremap <Leader>yy "+yy

" File browser
lua << EOF
require('nvim-tree').setup({
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = ' ',
					arrow_open = ' ',
				},
			},
		},
	},
})
EOF
nnoremap <Leader>n :NvimTreeToggle<CR>
nnoremap <Leader>o :NvimTreeFindFileToggle<CR>

" Help
nnoremap <Leader>? :vertical help<Space>

" Layout
set colorcolumn=+1
set cursorline
" Hide `~` on empty lines at end of buffer
set fillchars=eob:\ 
set list
"set listchars+=eol:↵
set listchars+=nbsp:␣
" set listchars+=tab:→\ 
set listchars+=tab:│\ 
set listchars+=trail:·
" Show line numbers
set number
set signcolumn=yes
set shiftwidth=4
set splitbelow
set splitright
set tabstop=4

lua << EOF
require('lualine').setup({
	options = {
		component_separators = {},
		section_separators = {},
	},
	sections = {
		lualine_c = {},
		lualine_x = { 'encoding' },
		lualine_y = { 'progress' },
	},
})
require('gitsigns').setup()
require('showkeys').setup()
require('smear_cursor').setup()
EOF
nnoremap <Leader>sk :ShowkeysToggle<CR>

" Search
set ignorecase
set smartcase
" nnoremap <Leader>l :nohlsearch<CR>

lua << EOF
require('telescope').setup({
	defaults = {
		preview = false,
	},
})
EOF
nnoremap <Leader>b :Telescope buffers<CR>
nnoremap <Leader>f :Telescope live_grep<CR>
nnoremap <Leader>g :Telescope git_files<CR>
" nnoremap <Leader>q :Telescope quickfix<CR>
nnoremap <Leader>s :Telescope grep_string<CR>
nnoremap <Leader><Space> :Telescope find_files<CR>

" Saving
nnoremap <C-S> :update<CR>
inoremap <C-S> <C-O>:update<CR>
vnoremap <C-S> <C-C>:update<CR>gv
" map <C-S> <Esc>:w<CR>
" imap <C-S> <Esc>:w<CR>
