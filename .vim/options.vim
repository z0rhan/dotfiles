syntax on

set guicursor&  " Reset to default cursor

set colorcolumn=80,100

set number
set relativenumber
set scrolloff=8

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set autoindent
set smartindent

set ignorecase
set smartcase

" Make ESC and Ctrl-[ faster
set ttimeout
set ttimeoutlen=10
set timeoutlen=500

" Lightline
set laststatus=2

" auto-close brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
