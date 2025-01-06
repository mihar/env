call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'joshdick/onedark.vim'
Plug 'mattn/emmet-vim'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'

" Plugin outside ~/.nvim/plugged with post-update hook
Plug '/usr/local/opt/fzf'

" Initialize plugin system
call plug#end()

syntax on
colorscheme onedark

set background=dark
set number	" Show line numbers
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)

set cursorline       "hilight the line of the cursor
set cursorcolumn     "hilight the column of the cursor


set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
 
set autoindent	 " Auto-indent new lines
set shiftwidth=2 " Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=2	" Number of spaces per Tab
set expandtab

set showtabline=0	" Show tab bar
set autochdir	" Change working directory to open buffer

set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
set encoding=utf-8 
set mouse=a

map <C-h> <C-w>h 
map <C-j> <C-w>j 
map <C-k> <C-w>k 
map <C-l> <C-w>l 

nmap <C-p> :FZF<CR>

