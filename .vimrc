" :PlugInstall {{{
" ----------------
call plug#begin()

" Atom One colorschemes for Vim
Plug 'rakr/vim-one'

" Status line
Plug 'vim-airline/vim-airline'

call plug#end()
" }}}

" Colors {{{
" ----------
colorscheme one
set background=dark
set termguicolors
syntax enable
" }}}

" vim-airline {{{
" ---------------
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
" }}}

