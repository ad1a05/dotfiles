set nocompatible    "not compatible with vi

filetype off

if !empty(glob('~/.vim/bundle/Vundle.vim'))
    """Vundle plugin management
    "$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    "Run :PluginInstall to install plugins with Vundle
    set runtimepath+=~/.vim/bundle/Vundle.vim

    call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'

    "full path fuzzy file, buffer, mru, tag, ...finder
    Plugin 'ctrlpvim/ctrlp.vim'

    "easymotion
    Plugin 'easymotion/vim-easymotion'

    "nerdtree
    Plugin 'scrooloose/nerdtree'

    "YouCompleteMe needs to be compiled and installed after PluginInstall:
    "1. Install cmake and python-dev and python3-dev;
    "2. $ cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer
    "Plugin 'Valloric/YouCompleteMe'

    call vundle#end()
endif

filetype plugin on
filetype indent on 

set history=100

set autoread    "auto read when file updated outside

"""no backup files and swap files
set nobackup
set nowb
set noswapfile

"""edit
set expandtab   "replace tab with space 
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab

set backspace=eol,start,indent
set showmatch   "show matching bracets
set mat=1       "tenths of a second to blink for matching bracets


"""User Interface
set so=7    "keep lines to cursors when scrolling up and down
set wrap    "wrap lines longer than window width
set wildmenu    "command-line completion
set ruler
set cmdheight=2
set showcmd "show (partial) command in the last line of the screen
set hidden  "switch buffer without saving
set splitbelow  "split window below current one

"""status line
set laststatus=2    "always show status line
set statusline=%n:\ 
set statusline+=%f\ [%{getcwd()}]
set statusline+=%m%r%h\ 
set statusline+=%=
set statusline+=%l,%c\ \ 
set statusline+=%p%%

"""table
set showtabline=2   "always show tab line
set splitbelow      "show preview window at bottom

"""search
set ignorecase  "ignore case when searching
set smartcase
set hlsearch    "highlight search things
set incsearch   "show search result when typing

"set nolazyredraw "Don't redraw while executing macros 

set magic       "Set magic on, for regular expressions


"be quiet..
set noerrorbells
set novisualbell

"indent
set autoindent
set smartindent

syntax enable
set number
set encoding=utf8


"""Key mappings
let mapleader = "\<Space>"
"let localmapleader=','
""remap <ESC>
"noremap <C-f> <esc>
"inoremap <C-f> <esc>
"cnoremap <C-f> <End><C-u><backspace>
""Insert and Command-line
noremap! <C-a> <Home>
noremap! <C-e> <End>
noremap! <C-f> <right>
noremap! <C-b> <left>
noremap! <C-p> <up>
noremap! <C-n> <down>
"move cursor around under insert mode
noremap! <C-j> <down>
noremap! <C-k> <up>
noremap! <C-h> <left>
noremap! <C-l> <right>

"Normal, Visual, Select, Operator-pending modes
""arrows to switch buffers
map <right> :bn<cr>
map <left>  :bp<cr>
noremap <C-j> j
noremap <C-k> k
noremap <C-h> h
noremap <C-l> l
noremap J 5j
noremap K 5k
noremap H b
noremap L w
noremap <leader>J :join<cr>
noremap <leader>K K
""switch windows by <leader>jkhl under normal mode
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>h <C-w>h
map <leader>l <C-w>l
""table operations
map <leader>tn :tabnew<cr>
map <Tab> :tabnext<cr>
map <S-Tab> :tabprevious<cr>
"gt/gT for :tabnext/:tabprevious
"next/prev error
map <leader>n :cn<cr>
map <leader>p :cp<cr>
"shortcuts for vim-youcompleteme
map <C-g> :YcmCompleter GoTo<cr>
"use <C-o>/<C-i> to jump through jumplist, and `` to jump between two positions

""" Colors
set t_Co=256    "Number of terminal colors
"color of status line
colorscheme default
highlight StatusLine term=reverse cterm=reverse gui=reverse ctermfg=Grey guifg=Grey
highlight StatusLineNC term=reverse cterm=reverse gui=reverse ctermfg=DarkGrey guifg=DarkGrey
