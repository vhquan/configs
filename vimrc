" ====== INIT START ======
let mapleader = ","

call plug#begin()
Plug 'bfrg/vim-cpp-modern'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'easymotion/vim-easymotion'
Plug 'vhquan/candycode'
call plug#end()

filetype plugin indent on
syntax on
set noshowmode
set laststatus=2

set t_Co=256
set background=dark
if !has("gui_running")
    colorscheme candycode
end

set hlsearch
set incsearch
set number

set ts=4 sw=4 sts=4
set et ai si
set textwidth=78
set backspace=indent,eol,start
set wildmode=list:longest,full

autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -std=c++17 -O2 -Wall % -o %:r && ./%:r <CR>
set nocompatible

" Disable automatic commenting on newline
auto FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

