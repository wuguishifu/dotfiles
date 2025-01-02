" syntax highlighting
syntax on
set autoindent
" colorscheme elflord
colorscheme desert
set showmode
set showcmd

" tabs
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" line numbers
set number
highlight LineNr ctermfg=DarkGrey
highlight LineNr guifg=#7c7c7c

" searching
set incsearch
set hlsearch
nnoremap <silent> <C-l> :nohl<CR>:let @/ = ""<CR>

function! ExecuteSearch(command)
  if strlen(@/) > 0
    execute "normal! " .. a:command
  endif
endfunction

nnoremap <silent> n :call ExecuteSearch("n")<CR>
nnoremap <silent> N :call ExecuteSearch("N")<CR>

" exiting a file when vimming in a directory
let mapleader = "\\"
nnoremap <Leader>q :Ex<CR>

" remaps
" movement
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
" tabs
nnoremap gr gT

