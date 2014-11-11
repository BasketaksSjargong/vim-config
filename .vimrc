" Vim configuration - For use with terminator and Molkai colorscheme

set nocompatible 		" be iMproved

"""""""""""""""""""""""""""""""""""""""""""""""""
" START VUNDLE CONFIG
"""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

if exists(':Plugin')
	" Let vundle manage itself
	Plugin 'gmarik/Vundle.vim'
	" Easy commenting in vim
	Plugin 'tpope/vim-commentary'
	" Vim defaults anyone can agree on
	Plugin 'tpope/vim-sensible'
	" VimAirline - lightweight Powerline
	Plugin 'bling/vim-airline'
	" VimTabular - autoaligning blocs of text by delimiter
	Plugin 'godlygeek/tabular'

	call vundle#end()
	filetype plugin indent on
endif
"""""""""""""""""""""""""""""""""""""""""""""""""
" END VUNDLE CONFIG
"""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS - (Using vim-sensible) as baseline
"""""""""""""""""""""""""""""""""""""""""""""""""

if has('autocmd')
	filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
	syntax enable
endif

set autoindent        " preserve indent level on newlines
set tabstop=2         " a tab is two spaced
set shiftwidth=2      " << shift is two spaces
set expandtab         " use spaces, not tabs
set smarttab

set complete-=i       " Removing searching through included files in keyword completion

set incsearch         " incremental searching
set ignorecase        " searches are case insensitive
set smartcase         " ... unless they contain at least one capital letter

set showcmd           " show partial command in bottom-right
set wildmenu          " use tab completion on command line

" Controls the number of lines/chars to keep visible before scrolling
set scrolloff=1
set sidescrolloff=5
set sidescroll=1
set display+=lastline " show the last line that fits in window

" Setting color-scheme
set t_Co=256
colorscheme molokai 
let g:rehash256 = 1

" Swap-file management 
" Save them to external directory
set swapfile
set directory=$TMPDIR,~/tmp,~/.vim/tmp,/tmp,/var/tmp
set backup
set backupdir=$TMPDIR,~/tmp,~/.vim/tmp,/tmp,/var/tmp

" Undo-history, saves across sessions
if has('persistent_undo')
  set undodir=$TMPDIR,~/tmp,~/.vim/tmp,/tmp,/var/tmp
  set undofile
  set undoreload=10000
end
set undolevels=10000

" Line numbering
if exists('+relativenumber')
  set relativenumber
end
set number

" Remapping esc to the key combination jk
:inoremap jk <Esc> 

" Setting colorscheme to molokai

" Enabling syntax highlighting
syntax on
