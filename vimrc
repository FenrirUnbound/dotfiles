set nocompatible      " Use vim settings, not vi settings


let mapleader = ","   " redefine <leader> as ',' key
set hidden            " buffers can exist in background w/o being in a window


"""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""

set showcmd                 " display incomplete commands
"set autoread               " reload files changed outside vim
set history=500             " remember the last n commands & search patterns

" Intuitive backspace
set backspace=indent,eol,start  

" enable type-specific configuration; type-specific syntax and indentation
filetype on
filetype plugin on
filetype indent on


"""""""""""""""""""""""""""""
" Visual Settings
"""""""""""""""""""""""""""""
syntax on                   " Syntax highlighting
set ls=2                    " always show status line
set novisualbell            " turn off visual bell
set nowrap                  " don't wrap lines
set ruler                   " show the cursor position in bottom-right corner
set showmode                " display current mode
set title                   " show title in console title bar
set visualbell t_vb=        " turn off error beep/flash

" Catch trailing whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR


"""""""""""""""""""""""""""""
" Search Settings
"""""""""""""""""""""""""""""
set hlsearch                " highlight search terms
set ignorecase              " ignore case when searching
set incsearch               " dynamically show search matches as you type

" ignore case if search pattern is all lowercase, case-sensitive otherwise
" note: *-style search is still case-sensitive
set smartcase

" Set key to silence search term highlighting
nmap <silent> <leader>n :silent :nohlsearch<CR>


"""""""""""""""""""""""""""""
" Swap File Settings
"""""""""""""""""""""""""""""
"set noswapfile             " turn off swap file?
set nobackup                " do not keep a backup file


"""""""""""""""""""""""""""""
" Indentation Settings
"""""""""""""""""""""""""""""
set autoindent              " enable auto-indent
set expandtab               " tabs are converted to spaces
set nocindent               " disables automatic C program indenting
set shiftwidth=2            " number of spaces to auto-indent
set smartindent             " Smart autoindent when starting a new line
set smarttab                " insert tabs at line beginning based on shiftwidth
set softtabstop=2           " Tab is 2 spaces when editing
set tabstop=4               " Tab is 2 spaces when reading in a file
"set noexpandtab            " tabs are preserved (i.e., not spaces)


"""""""""""""""""""""""""""""
" Scrolling Settings
"""""""""""""""""""""""""""""
set scrolloff=5             " keep n lines when scrolling vertically
set sidescrolloff=5         " keep n lines when scrolling horizontally
set sidescroll=1            " minimal number of columns to scroll horizontally


"""""""""""""""""""""""""""""
" Completion Settings
"""""""""""""""""""""""""""""
set wildmenu                " see other autocompletion options
set wildmode=list:longest   " completion behaves similar to a  shell


"""""""""""""""""""""""""""""
" autocmd Settings
"""""""""""""""""""""""""""""
if has("autocmd")
    au FileType c set cindent
    "au FileType cpp,c,java,sh,pl,php,phtml,asp,xml,javascript   set smartindent
    "au FileType cpp,c,java,sh,pl,php,phtml,asp,xml,javascript   set autoindent
    "au FileType cpp,c,java,sh,pl,php,phtml,asp,xml,javascript   set expandtab
endif

"""""""""""""""""""""""""""""
" Enable Localized Settings
"""""""""""""""""""""""""""""
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
