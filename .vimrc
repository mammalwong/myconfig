syntax enable
set t_Co=256
set showtabline=2 laststatus=2 ruler showcmd
set ttimeoutlen=50
set backspace=indent,eol,start
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab smartindent
set colorcolumn=80
set incsearch ignorecase smartcase hlsearch
set number relativenumber
set mouse=a ttymouse=xterm2
set foldenable foldmethod=syntax
set wildmenu wildmode=full
set tags=./tags,tags
set cursorline
set ttyfast
set splitbelow " can make the preview window split below
set scrolloff=20
set completeopt=menuone,longest,preview
set virtualedit=block

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
"Plugin 'vim-scripts/AutoComplPop'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'godlygeek/tabular'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mbbill/undotree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'neoclide/vim-jsx-improve'
Plugin 'tomlion/vim-solidity'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" showcmd wont work before plugins are loaded
set showcmd

" following line makes the autocomplete box takes enter as selection
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:EasyMotion_do_shade=0
let g:EasyMotion_smartcase=1

let g:easytags_file='~/.vim/tags'
let g:easytags_dynamic_files=1

color molokai_dark
highlight ColorColumn ctermbg=yellow ctermfg=black
autocmd InsertEnter * :highlight ColorColumn ctermbg=blue
autocmd InsertLeave * :highlight ColorColumn ctermbg=yellow

" load the emenu menu options
source $VIMRUNTIME/menu.vim

" enable the acejump from easymotion as 's'
nmap s <Plug>(easymotion-overwin-f2)

imap jk <Esc>
" imap kj <Esc>

" turn off relative number when in insert mode
" autocmd InsertEnter * :set norelativenumber
" autocmd InsertLeave * :set relativenumber

" show hidden files in NerdTree
let g:NERDTreeShowHidden=1

" turn of NerdTree if vim starts with no file to open
autocmd VimEnter * if !argc() | NERDTree | endif

" auto open tagbar if the filetype is supported
" autocmd FileType * nested :call tagbar#autoopen(0)

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:ctrlp_extensions = ['quickfix', 'line', 'buffertag']

let g:AutoPairsShortcutToggle = ''

let g:signify_vcs_list = ['git', 'svn']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_checkers = ['eslint']
let g:syntastic_javascript_checkers = ['eslint', 'jsxhint']
let g:syntastic_java_checkers = ['javac']
let g:syntastic_c_checkers = ['gcc']
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_python_checkers = ['pylint', 'python']
let g:syntastic_go_checkers = ['gofmt', 'go']
let g:syntastic_solidity_checkers = ['solc']
