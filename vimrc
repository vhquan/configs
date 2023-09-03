" ====== INIT START ======

call plug#begin()
Plug 'fxn/vim-monochrome'
Plug 'bfrg/vim-cpp-modern'
Plug 'sheerun/vim-polyglot'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'itchyny/lightline.vim'
Plug 'agude/vim-eldar'
Plug 'bignimbus/pop-punk.vim'
Plug 'mhinz/vim-startify'
Plug 'Everblush/everblush.vim'
call plug#end()

filetype plugin indent on
syntax on
set noshowmode
set laststatus=2

set background=dark
"let g:monochrome_italic_comments = 1
"colorscheme monochrome
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

colorscheme everblush

let g:lightline = {
    \ 'colorscheme': 'everblush',
\ }

set hlsearch
set incsearch
set number

set ts=4 sw=4 sts=4
set et ai si
set textwidth=78
set wildmode=list:longest,full
