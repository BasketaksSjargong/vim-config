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
  " Easy git integration is vim
  Plugin 'tpope/vim-fugitive'
  " Surrounding selections in delimiters.
  Plugin 'tpope/vim-surround'
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

if has('multi_byte')
  if &termencoding == ' '
    let &termencoding = &encoding
  endif
  set encoding=utf-8
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

set showcmd             " show partial command in bottom-right
set wildmenu            " use tab completion on command line
set wildignore+=*/tmp/* " excludes temp folder from wildmenu

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


set nowrap                " don't wrap lines (map leader-W to toggle)
set linebreak             " when wrapping, wrap at word boundaries
if exists('+breakindent')
  set breakindent         " preserves the indent level of wrapped lines
  set showbreak=↳
  set wrap                " wrapping with breakindent is tolerable
endif

" Use par to reflow text / Requires the par-package (AUR on arch)
if executable('par')
  set formatprg="par -h -w78 -B=.,\?_A_a "
endif

" Airline fonts
let g:airline_powerline_fonts=1
"""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""
nmap <space> <leader>
" Treat wrapped lines as true lines when moving
nmap <expr> j (v:count == 0 ? 'gj' : 'j')
nmap <expr> k (v:count == 0 ? 'gk' : 'k')
" Allow writing via sudo
cnoremap w!! w !sudo tee > /dev/null %
" Remapping esc to the key combination jk
inoremap jk <Esc> 
" Overwriting with defaults
syntax on
" Reindent the entire file
nmap <leader>= gg=G``:echo "reindent global"<CR>

" Fugitive mappings (vim-fugitive)
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gp :Git push<cr>

" Tabular mappings (vim-tabular)
nnoremap <Leader>t= :Tabularize /=<CR>
vnoremap <Leader>t= :Tabularize /=<CR>
nnoremap <Leader>t: :Tabularize /:<CR>
vnoremap <Leader>t: :Tabularize /:<CR>
nnoremap <Leader>t, :Tabularize /,<CR>
vnoremap <Leader>t, :Tabularize /,<CR>

" Moving between windows easily
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

