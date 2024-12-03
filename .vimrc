set number                          " Show line numbers
set tabstop=4                       " Set tab width to 4 spaces
set shiftwidth=4                    " Set indentation width to 4 spaces
set expandtab                       " Use spaces instead of tabs
set mouse=a                         " Enable mouse support
autocmd CursorHold * silent! write  " Auto-save on cursor hold
set updatetime=300                  " Set update time for CursorHold

" Disable swap files:
set noswapfile                      " Prevent creation of swap files

call plug#begin()                   " Start plugin management

Plug 'elzr/vim-json'                " JSON syntax highlighting
Plug 'jiangmiao/auto-pairs'         " Auto-pairing of brackets
Plug 'hdima/python-syntax'          " Python syntax highlighting
Plug 'dracula/dracula-theme'        " Dracula color scheme
Plug 'tpope/vim-sensible'           " Sensible default settings
Plug 'terryma/vim-multiple-cursors'  " Multiple cursors support
Plug 'myusuf3/numbers.vim'          " Numbering support
Plug 'hdima/python-syntax'          " Python syntax highlighting (duplicate)
Plug 'hynek/vim-python-pep8-indent' " PEP8 indentation for Python
Plug 'tweekmonster/braceless.vim'   " Braceless syntax highlighting
Plug 'ervandew/supertab'            " Enhanced tab completion
Plug 'scrooloose/nerdtree'          " File explorer
Plug 'rust-lang/rust.vim'           " Rust syntax highlighting

call plug#end()                     " End plugin management

nnoremap <leader>n :NERDTreeFocus<CR>  " Map leader+n to focus NERDTree
nnoremap <C-n> :NERDTree<CR>            " Map Ctrl+n to open NERDTree
nnoremap <C-b> :NERDTreeToggle<CR>      " Map Ctrl+b to toggle NERDTree
nnoremap <C-f> :NERDTreeFind<CR>        " Map Ctrl+f to find in NERDTree

let g:multi_cursor_start_key='<C-d>'   " Set key for starting multi-cursor
let g:multi_cursor_next_key='<C-n>'     " Set key for next multi-cursor
let g:multi_cursor_skip_key='<C-x>'     " Set key for skipping multi-cursor
let g:multi_cursor_quit_key='<C-c>'     " Set key for quitting multi-cursor
