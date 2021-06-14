set nocompatible    "not compatible with vi

filetype off

if !empty(glob('~/.vim/autoload/plug.vim'))
    "curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    "    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    call plug#begin('~/.vim/plugged')

    Plug 'altercation/vim-colors-solarized'

    "fzf
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    
    "airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    call plug#end()
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

let mapleader = "\<Space>"
"let localmapleader=','

function InitKeyMappings()
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
    map <Tab> :bn<cr>
    map <S-Tab> :bp<cr>
    noremap <C-j> j
    noremap <C-k> k
    noremap <C-h> h
    noremap <C-l> l
    ""switch windows by <leader>w under normal mode
    map <leader>wj <C-w>j
    map <leader>wk <C-w>k
    map <leader>wh <C-w>h
    map <leader>wl <C-w>l
    ""switch buffers by <leaders>b under normal mode
    map <leader>bh :bp<cr>
    map <leader>bl :bn<cr>
    map <leader>bj :b#<cr>
    map <leader>bk :b#<cr>

    "next/prev error
    map <leader>n :cn<cr>
    map <leader>p :cp<cr>

    "fzf
    map <leader>ff :Files<cr>
    map <leader>fb :Buffers<cr>
    map <leader>ft :Tags<cr>
    map <leader>fl :Lines<cr>

endfunction

""" Colors
function InitColor()
    set t_Co=256    "Number of terminal colors
    try
        let g:solarized_termcolors=256
        set background=dark
        colorscheme solarized
    catch /^Vim\%((\a\+)\)\=:E185/
        set background=dark
        colorscheme default
        highlight StatusLine term=reverse cterm=reverse gui=reverse ctermfg=Grey guifg=Grey
        highlight StatusLineNC term=reverse cterm=reverse gui=reverse ctermfg=DarkGrey guifg=DarkGrey
    endtry
endfunction

function InitAirlineStyle()
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_theme='dark'
    let g:airline_theme='solarized'
endfunction

call InitKeyMappings()
call InitColor()
call InitAirlineStyle()

