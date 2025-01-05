set magic

if !isdirectory(expand("~/.vim/tmp"))
  call mkdir(expand("~/.vim/tmp"), "p")
endif

set directory=~/.vim/tmp//

let mapleader = "\\"

if has('termguicolors')
  set termguicolors
endif

if &compatible
  set nocompatible
endif

if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif

set sessionoptions-=options
set viewoptions-=options

" syntax highlighting
syntax on
colorscheme iceberg
set background=dark

if !exists('g:is_posix') && !exists('g:is_bash') && !exists('g:is_kornshell') && !exists('g:is_dash')
  let g:is_posix = 1
endif

" line numbers
set number

" general
set autoindent
set ruler
set wildmenu
set wildmode=longest:full,full
set backspace=indent,eol,start
set showmode
set showcmd

" tabs
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" searching
set incsearch
set hlsearch

function! ExecuteSearch(command) abort
  if strlen(@/) > 0
    execute "normal! " .. a:command
  endif
endfunction

nnoremap <silent> <C-l> :nohl<CR>:let  @/ = ""<CR>
nnoremap <silent> n :call ExecuteSearch("n")<CR>
nnoremap <silent> N :call ExecuteSearch("N")<CR>

