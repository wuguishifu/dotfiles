let mapleader = "\\"

if has('termguicolors')
  set termguicolors
endif

" syntax highlighting
syntax on
colorscheme iceberg
set background=dark

" line numbers
set number

" general display
set autoindent
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

