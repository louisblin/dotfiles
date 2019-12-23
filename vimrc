" Vundle plugins
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'LnL7/vim-nix'
Plugin 'bling/vim-airline'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
call vundle#end()

filetype plugin indent on

" Set Theme
"colorscheme solarized
set bg=dark

" Don't create annoying files
set nobackup
set noswapfile

" Enable color syntaxing
syntax on

" Enable hidden buffer
set hidden

" Show ruler
set ruler

" Add line numbers
set number
set relativenumber

" Expand tabs into spaces
set expandtab
set shiftwidth=4
set softtabstop=4

" Highlight search results
set hlsearch

" Incremental search
set incsearch

set nowrap

set backspace=indent,eol,start

set clipboard=unnamed

" Disable arrows, get used to hjkl
noremap <Left> <NOP>
noremap <Down> <NOP>
noremap <Up> <NOP>
noremap <Right> <NOP>
inoremap <Left> <NOP>
inoremap <Down> <NOP>
inoremap <Up> <NOP>
inoremap <Right> <NOP>

" Disable Escape, get used to jk
inoremap <Esc> <NOP>
inoremap jk <Esc>
inoremap kj <Esc>

" Disable annoying beeping
set noerrorbells
set vb t_vb=

set shell=zsh

set exrc
set secure

"set mouse=nicra
"set ttymouse=sgr

" Unix file format
set ff=unix

let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>qq :q!<CR>
nnoremap <Leader>wq :wq<CR>

" Remove trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e
