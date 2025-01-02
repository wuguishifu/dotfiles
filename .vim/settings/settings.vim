let mapleader = "\\"

" syntax highlighting
syntax on
colorscheme iceberg
set background=dark

" general display
set autoindent
set showmode
set showcmd

" tabs
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" line numbers
set number
highlight LineNr ctermfg=DarkGrey
highlight LineNr guifg=#7c7c7c

" searching
set incsearch
set hlsearch

function! ExecuteSearch(command)
  if strlen(@/) > 0
    execute "normal! " .. a:command
  endif
endfunction

nnoremap <silent> <C-l> :nohl<CR>:let  @/ = ""<CR>
nnoremap <silent> n :call ExecuteSearch("n")<CR>
nnoremap <silent> N :call ExecuteSearch("N")<CR>

