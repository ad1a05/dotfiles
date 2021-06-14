set nocompatible    "not compatible with vi
filetype off

call plug#begin(stdpath('data') . '/plugged')
"""Manually install fzf
"""upgrade fzf: cd ~/.fzf && git pull && ./install
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

"""theme
Plug 'altercation/vim-colors-solarized'

"""airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'neovim/nvim-lspconfig'

call plug#end()

filetype plugin on
filetype indent on 

let mapleader = "\<Space>"

function InitBasic()
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
    set so=7        "keep lines to cursors when scrolling up and down
    set wrap        "wrap lines longer than window width
    set wildmenu    "command-line completion
    set ruler
    set cmdheight=2
    set showcmd     "show (partial) command in the last line of the screen
    set hidden      "switch buffer without saving
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
endfunction

function InitBasicKeyMappings()
    ""Insert and Command-line
    noremap! <C-a> <Home>
    noremap! <C-e> <End>
    noremap! <C-f> <right>
    noremap! <C-b> <left>
    noremap! <C-p> <up>
    noremap! <C-n> <down>
    "Normal, Visual, Select, Operator-pending modes
    ""arrows to switch buffers
    "map <Tab> :bn<cr>
    "map <S-Tab> :bp<cr>
    ""switch windows by <leader>w under normal mode
    map <leader>wj <C-w>j
    map <leader>wk <C-w>k
    map <leader>wh <C-w>h
    map <leader>wl <C-w>l

    """buffer operations by <leaders>b
    map <leader>bd :bd<cr>
    map <leader>bp :bp<cr>
    map <leader>bn :bn<cr>
    map <leader>bl :b#<cr>

    """next/prev error
    map <leader>cn :cn<cr>
    map <leader>cp :cp<cr>
endfunction

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

function InitFzf()
    map <leader>ff :Files<cr>
    map <leader>bb :Buffers<cr>
    map <leader>ft :Tags<cr>
    map <leader>fl :Lines<cr>
endfunction

function InitAirlineStyle()
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_theme='dark'
    let g:airline_theme='solarized'
endfunction

call InitBasic()
call InitBasicKeyMappings()
call InitColor()
call InitAirlineStyle()
call InitFzf()

"""lsp config
lua << EOF
require'lspconfig'.rls.setup{}
require'lspconfig'.clangd.setup{}
EOF

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "rust_analyzer", "tsserver", "clangd" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF

