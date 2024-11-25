# To install run:
# source %
# :PlugInstall

set number
set tabstop=4       
set shiftwidth=4   
set expandtab     
set mouse=a
autocmd CursorHold * silent! write
set updatetime=300



call plug#begin()

Plug 'jiangmiao/auto-pairs'
Plug 'hdima/python-syntax'
Plug 'dracula/dracula-theme'
Plug 'tpope/vim-sensible'
Plug 'terryma/vim-multiple-cursors'
Plug 'myusuf3/numbers.vim'
Plug 'hdima/python-syntax'
Plug 'hynek/vim-python-pep8-indent'
Plug 'tweekmonster/braceless.vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'rust-lang/rust.vim'

call plug#end()

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:multi_cursor_start_key='<C-d>'
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<C-c>'
