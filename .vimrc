" Zach's Vim config

" Be iMproved
set nocompatible
syntax on
filetype plugin indent on

"*****************************************************************************
"" Vim Plug
"*****************************************************************************"

" Plugins will be downloaded under the specified directory
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible' 
Plug 'sheerun/vim-polyglot' 
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-commentary' " Allow comment/uncomment lines
Plug 'tpope/vim-surround'
Plug 'digitaltoad/vim-pug'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
call plug#end()

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"

" enable mouse support
set mouse=a

" Clipboard
set clipboard=unnamed

" Disables comments that continue on the next line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Map leader to [space]
let mapleader=' '

set noswapfile
set breakindent
set linebreak
let &showbreak = '↳ '



" Interpret octal as decimal when incrementing numbers
set nrformats-=octal

" Things to make the theme work on iTerm
set t_8b=^[[48;2;%lu;%lu;&lum
set t_8f=^[[38;2;%lu;%u;%lum
let g:onedark_termcolors=16
colorscheme onedark

" Show existing tab with 2 spaces with
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

set number
set ruler

let g:airline_theme='onedark'

" Showing ALE in airline
let g:airline#extensions#ale#enabled = 1


nmap <F8> :TagbarToggle<CR>
nnoremap <C-p> :FZF<CR>

" Ale
let g:ale_linters = {'javascript' : ['eslint']}
let g:ale_completion_enabled = 1
let b:ale_fixers = {'javacript': ['prettier', 'eslint']}
" let g:ale_fix_on_save = 1
" let g:ale_open_list = 1

" NERDtree
" Opens NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Maps Ctrl-N to open NERDTree
map <C-n> :NERDTreeToggle<CR>
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
