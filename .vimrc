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
set nofoldenable foldmethod=indent foldlevelstart=999 foldcolumn=1
set wildmenu wildmode=full
set tags=./tags,tags
set cursorline
set ttyfast
set splitbelow " can make the preview window split below
set nowrap scrolloff=20 sidescrolloff=20 sidescroll=1
set completeopt=menuone,longest,preview
set virtualedit=block
set diffopt+=vertical
set fillchars+=vert:│
set backupdir=~/.vim/backup// directory=~/.vim/swap// undodir=~/.vim/undo//
set undofile
set guioptions-=T

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
Plugin 'w0rp/ale'
Plugin 'flazz/vim-colorschemes'
Plugin 'tomasiser/vim-code-dark'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'wellle/targets.vim'
Plugin 'bkad/CamelCaseMotion'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdtree-git-plugin'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'kshenoy/vim-signature'
Plugin 'godlygeek/tabular'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mbbill/undotree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'yggdroot/indentline'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'idanarye/vim-vebugger'
Plugin 'ashisha/image.vim'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'neoclide/vim-jsx-improve'
Plugin 'tomlion/vim-solidity'
Plugin 'rust-lang/rust.vim'

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

call camelcasemotion#CreateMotionMappings('<leader>')

let g:easytags_file='~/.vim/tags'
let g:easytags_dynamic_files=1

"color molokai_dark
"color jellybeans
color codedark
let g:airline_theme='dark'
highlight Normal ctermbg=NONE
"highlight LineNr ctermbg=235 ctermfg=lightgray
"highlight CursorLineNR ctermbg=black ctermfg=yellow
highlight CursorLineNR ctermbg=black
highlight EndOfBuffer ctermbg=NONE ctermfg=black

autocmd InsertEnter * set cursorcolumn
autocmd InsertLeave * set nocursorcolumn

" load the emenu menu options
source $VIMRUNTIME/menu.vim

" enable the acejump from easymotion as 's'
nmap s <Plug>(easymotion-bd-w)
nmap S <Plug>(easymotion-overwin-w)
nmap <Leader>h <Plug>(easymotion-linebackward)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)
nmap <Leader>l <Plug>(easymotion-lineforward)
let g:EasyMotion_do_shade=0
let g:EasyMotion_smartcase=1
let g:EasyMotion_startofline=0
let g:EasyMotion_keys = 'sadfjklewcmpgh'

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

imap jk <Esc>
" imap kj <Esc>

nmap <F1> :YcmCompleter GetDoc<CR>
nmap <F2> :YcmCompleter RefactorRename<CR>
nmap <F11> :YcmCompleter GetType<CR>
nmap <F12> :YcmCompleter GoTo<CR>
nmap <S-F12> :YcmCompleter GoToReferences<CR>

nmap <F3> :TagbarToggle<CR>

nmap <S-F11> :NERDTreeToggle<CR>

nmap <S-F9> :UndotreeToggle<CR>

nmap <F4> :VBGtoggleBreakpointThisLine<CR>
nmap <S-F5> :VBGkill<CR>
nmap <F6> :VBGcontinue<CR>
nmap <F7> :VBGstepIn<CR>
nmap <S-F7> :VBGstepOver<CR>
nmap <F8> :VBGstepOut<CR>
nmap <F9> :VBGevalWordUnderCursor<CR>
autocmd FileType python nmap <buffer> <F5> :VBGstartPDB %:p<CR>

" turn off relative number when in insert mode
" autocmd InsertEnter * :set norelativenumber
" autocmd InsertLeave * :set relativenumber

" show hidden files in NerdTree
let g:NERDTreeShowHidden=1
let g:NERDTreeMouseMode=2

" turn of NerdTree if vim starts with no file to open
autocmd VimEnter * if !argc() | NERDTree | endif

" auto open tagbar if the filetype is supported
" autocmd FileType * nested :call tagbar#autoopen(0)

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 79, 'x': 60, 'y': 88, 'z': 45, 'warning': 80 }

let g:ctrlp_extensions = ['quickfix', 'line', 'buffertag']
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_max_files=50000
let g:ctrlp_max_depth=20

let g:AutoPairsShortcutToggle = ''

let g:signify_vcs_list = ['git', 'svn']

let g:rbpt_colorpairs = [
    \ ['red',         'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['brown',       'DarkOrchid3'],
    \ ]
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

autocmd FileType text,html,markdown setlocal spell

autocmd FileType * setlocal foldenable

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
