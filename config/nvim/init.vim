set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set syntax=1
set guicursor=
set relativenumber
set number
set nohlsearch
set hidden
set noerrorbells
set incsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=120

set nowrap

set noswapfile
set nobackup
" set undodir=~/.vim/undodir
" set undofile

let mapleader = " "
let maplocalleader = " "

nnoremap <leader>vrc <cmd> e ~/.config/nvim/. <CR>

nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>


call plug#begin('~/.vim/plugged') "Begining of vim plug

Plug 'morhetz/gruvbox'
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end() " End of vim plug


colorscheme gruvbox

