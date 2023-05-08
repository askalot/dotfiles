" :PlugInstall {{{
" ----------------
call plug#begin()
" Sensible defaults
Plug 'tpope/vim-sensible'
" Atom One colorschemes for Vim
Plug 'rakr/vim-one'
" Status line
Plug 'vim-airline/vim-airline'
" Fuzzy find
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Git changes in gutter
Plug 'airblade/vim-gitgutter'
" Toggle comments
Plug 'tpope/vim-commentary'
" Linting
Plug 'dense-analysis/ale'
" File browser
Plug 'preservim/nerdtree'
" Icons
Plug 'ryanoasis/vim-devicons'
call plug#end()
" }}}

" Defaults {{{
" ---------------------
" Map <Space> as <Leader>
let mapleader=' '
" Enable mouse
set mouse=a
" Enable UTF-8 encoding to support icons
set encoding=UTF-8
" }}}

" Colors {{{
" ----------
colorscheme one
set background=dark
set termguicolors
" }}}

" vim-airline {{{
" ---------------
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_min_count=2
let g:airline#extensions#tabline#buffers_label=''
let g:airline#extensions#tabline#formatter='unique_tail'
" }}}

" fzf {{{
" -------
nnoremap <Leader>p :Files<CR>
nnoremap <Leader>f :Rg<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
" }}}

" vim-commentary
" --------------
nnoremap <Leader>/ :Commentary<CR>
" }}}

" Linting {{{
" -----------
let g:ale_completion_enabled=1
let g:ale_fix_on_save=1
let g:ale_lint_on_enter=0
let g:ale_lint_on_save=1
let g:ale_sign_error='●'
let g:ale_sign_warning='⚠️'
let g:ale_fixers={}
let g:ale_fixers['javascript']=['prettier', 'eslint']
let g:airline#extensions#ale#enabled=1
" Jump to next error with <Leader>e
nmap <Leader>e <Plug>(ale_next_wrap)
" }}}

" NERDTree {{{
" ------------
let g:NERDTreeWinPos='right'
nnoremap <Leader>n :NERDTreeToggle<CR>
" }}}

" Buffers {{{
" -----------
nnoremap <Leader>t :enew<CR>
nnoremap <Leader>[ :bprevious<CR>
nnoremap <Leader>] :bnext<CR>
" }}}

