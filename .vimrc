let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator'

call plug#end()

syntax off
set background=dark

set guicursor&  " Reset to default cursor

set colorcolumn=80,100

set scrolloff=8
set number
set relativenumber

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set autoindent
set smartindent

set ignorecase
set smartcase

set laststatus=2
set statusline=%f\ %y\ %m\ %r\ %=Line:%l/%L\ Col:%c

let mapleader = " "
nmap <leader>v :Ex<CR>

filetype plugin indent on
