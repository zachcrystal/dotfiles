" Zach's Vim config

" Be iMproved
set nocompatible
syntax on
filetype plugin indent on
set splitright
set splitbelow

" This changes typescript's filetype to javascript for better syntax
" I'll probably keep this until I can learn how to extend yats to be better
augroup typescript_syntax_detection
  autocmd!
  autocmd BufNewFile,BufRead *.{ts},Jakefile setfiletype javascript
  " autocmd BufNewFile,BufRead * call s:SelectJavascript()
augroup END

"*****************************************************************************
"" Vim Plug
"*****************************************************************************"

" Plugins will be downloaded under the specified directory
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-commentary' " Allow comment/uncomment lines
Plug 'tpope/vim-surround'
Plug 'Shougo/denite.nvim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-unimpaired'
Plug 'mattn/emmet-vim'
call plug#end()

" Disables the version of vim-javascript in polyglot because pangloss is the orig source
let g:polyglot_disabled = ['javascript']

" Add extra colors to syntax groups for theme
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:blue = { "gui": "#61AFEF", "cterm": "39", "cterm16": "4" }
    let s:red = { "gui": "#E06C75", "cterm": "204", "cterm16": "1" }
    let s:purple = { "gui": "#C678DD", "cterm": "170", "cterm16": "5" }
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16": "7" }
    let s:yellow = { "gui": "#E5C07B", "cterm": "180", "cterm16": "3" }
    autocmd ColorScheme * call onedark#set_highlight("jsObjectProp", { "fg": s:red})
    autocmd ColorScheme * call onedark#set_highlight("jsObjectKey", { "fg": s:red})
    autocmd ColorScheme * call onedark#set_highlight("jsStaticFunc", { "fg": s:yellow})
    autocmd ColorScheme * call onedark#set_highlight("jsForAwait", { "fg": s:purple})
    autocmd ColorScheme * call onedark#set_highlight("jsAsyncKeyword", { "fg": s:purple})
    autocmd ColorScheme * call onedark#set_highlight("jsUpperVariableDef", { "fg": s:yellow})
    autocmd ColorScheme * call onedark#set_highlight("typescriptImport", { "fg": s:purple})
    autocmd ColorScheme * call onedark#set_highlight("typescriptExport", { "fg": s:purple})
    autocmd ColorScheme * call onedark#set_highlight("typescriptVariable", { "fg": s:purple})
    autocmd ColorScheme * call onedark#set_highlight("typescriptArrowFunc", { "fg": s:purple})
    autocmd ColorScheme * call onedark#set_highlight("typescriptIdentifierName", { "fg": s:blue})
    " autocmd ColorScheme * call onedark#set_highlight("typescriptVariableDeclaration", { "fg": s:blue})
    autocmd ColorScheme * call onedark#set_highlight("typescriptCall", { "fg": s:white})
  augroup END
endif

hi! link typescriptIdentiferName Special
"*****************************************************************************
"" Basic Setup
"*****************************************************************************"

" set hlsearch                                " highlights search term
" map <leader><enter> :noh<CR>
set cursorline                              " set cursorline
set number                                  " show current line number
set relativenumber                          " show relative line numbers

set mouse=a                                 " enable mouse support
if !has('nvim')
  set ttymouse=xterm2
endif
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

set belloff=all                             " turn bell sounds off

" Folding
set foldmethod=indent
set foldlevelstart=2

" Interpret octal as decimal when incrementing numbers
set nrformats-=octal

set background=dark
let g:onedark_termcolors=16
let g:onedark_terminal_italics=1
colorscheme onedark

set autoindent
set smarttab

" Show existing tab with 2 spaces with
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

set backspace=indent,eol,start                    " fix backspace behaviour

set ruler

" Airline
let g:airline_theme='onedark'
let g:airline_powerline_fonts=1
" remove the filetype part
let g:airline_section_x=''

" Showing ALE in airline
let g:airline#extensions#ale#enabled=1

nmap <F8> :TagbarToggle<CR>
nnoremap <C-p> :FZF<CR>
nnoremap <silent> <leader>- :Files <C-r>=expand("%:h")<CR>/<CR>
nnoremap <leader>!  :Rg<Space>

" Ale
nmap <leader>d <Plug>(ale_fix)

 " Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)
" let g:ale_linters_explicit=1
" let g:ale_completion_enabled=1
let g:ale_linters = {
\   'javascript': ['eslint']
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}

let g:ale_sign_error = '✖'
hi! ALEErrorSign guifg=#DF8C8C ctermfg=167
let g:ale_lint_on_text_changed='normal'
let g:ale_lint_on_save=1
let g:ale_fix_on_save=1

" NERDtree
" Opens NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Maps Ctrl-N to open NERDTree
map <C-n> :NERDTreeToggle<CR>
" Close vim if the only window left open is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI=1
let NERDTreeShowLineNumbers=1
" let NERDTreeDirArrows=1
let NERDTreeShowHidden=1
let NERDTreeWinSize=25
let g:NERDTreeStatusline='NERD'

"*****************************************************************************
"" Mappings
"*****************************************************************************"

" Maps leader q to quit
nnoremap <Leader>q :quit<CR>

" Move around splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resizes splits to be equal when the terminal is resized
autocmd VimResized * execute "normal! \<c-w>="

" Temporary - shows syntax group under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" set signcolumn=no
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set completeopt-=preview
let g:UltiSnipsExpandTrigger='<c-j>'

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

nnoremap <silent> <leader>e :call Fzf_dev()<CR>

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" Files + devicons
function! Fzf_dev()
  let l:fzf_files_options = '--preview "bat --theme="OneHalfDark" --style=numbers,changes --color always {2..-1} | head -'.&lines.'"'

  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' })
endfunction
