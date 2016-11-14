set nocompatible    "not compatible with vi

filetype off

"""Vundle plugin management
"$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"Run :PluginInstall to install plugins with Vundle
set runtimepath+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"YouCompleteMe needs to be compiled and installed after PluginInstall
"$ cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer
Plugin 'Valloric/YouCompleteMe'

call vundle#end()

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

"""status line
set laststatus=2    "always show status line
set statusline=\ %F%m%r%h\ %=\ %p%%

"""table
set showtabline=2   "always show tab line

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
let mapleader=','
""Insert and Command-line
noremap! <C-a> <Home>
noremap! <C-e> <End>
"move cursor around under insert mode
noremap! <C-j> <down>
noremap! <C-k> <up>
noremap! <C-h> <left>
noremap! <C-l> <right>

"Normal, Visual, Select, Operator-pending modes
""arrows to switch buffers
map <right> :bn<cr>
map <left>  :bp<cr>
""switch windows by Ctrl+jkhl under normal mode
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l
""table operations
map <leader>tn :tabnew<cr>
"gt/gT for :tabnext/:tabprevious
"next/prev error
map <leader>n :cn<cr>
map <leader>p :cp<cr>

""" Colors
set t_Co=256    "Number of terminal colors
