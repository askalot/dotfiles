" Map <Space> as <Leader>
let mapleader=' '

" Enable mouse
set mouse=a

" vim-plug
call plug#begin()

Plug 'metalelf0/base16-black-metal-scheme'
" Plug 'rakr/vim-one'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Backup files
set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//

" Buffers
nnoremap <Leader>w :bdelete<CR>
nnoremap <Leader>] :bnext<CR>
nnoremap <Leader>[ :bprevious<CR>
nnoremap <Leader>t :enew<CR>

" Colors
colorscheme base16-black-metal-bathory
" colorscheme one
set background=dark
set termguicolors

" Comments
nnoremap <Leader>/ :Commentary<CR>

" File explorer
let g:NERDTreeWinPos='right'
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>g :NERDTreeFind<CR>

" Linting
let g:airline#extensions#ale#enabled=1
let g:ale_completion_enabled=1
let g:ale_fix_on_save=1
let g:ale_fixers={ 'javascript': ['eslint', 'prettier'] }
let g:ale_lint_on_enter=0
let g:ale_lint_on_save=1
let g:ale_linters={ 'go' : ['gopls'] }
let g:ale_sign_error='●'
let g:ale_sign_warning='⚠️'

" Search
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :Rg<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>p :Files<CR>

" Status
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffers_label=''
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_theme='minimalist'
