" Plugin configuration section {{{

" vim-plug plugin management
" https://github.com/junegunn/vim-plug
call plug#begin('~/.nvim/bundle')

Plug 'kien/ctrlp.vim'
Plug 'hdima/python-syntax'
Plug 'bling/vim-airline'

Plug 'chrisbra/csv.vim'
Plug 'tpope/vim-fugitive'
Plug 'ap/vim-css-color'
Plug 'freeo/vim-kalisi' " Colorscheme
Plug 'mattn/emmet-vim' " Zen coding
Plug 'tpope/vim-commentary.git' " Quick commenting

Plug 'quasarj/VimSql', { 'branch': 'neovim' }

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
"Plug 'tomtom/tlib_vim'
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'garbas/vim-snipmate'

" Plug 'gerw/vim-HiLinkTrace'
call plug#end()

" Plugin configuration -------------------------------------------------

" 3 is supported in nvim but breaks ultisnips right now
let g:UltiSnipsUsePythonVersion = 2

"  Airline ----------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_min_count = 2

" csv display
let g:airline#extensions#csv#column_display = 'Name'

" End Plugin Config }}}
" Look and Feel  {{{

set mouse=a
colo kalisi

set noruler      " display line number and % info
set laststatus=2 " Always display window status bar
set noshowmode   " do not show mode text in the bottom bar
"set modelines=0  " fully disable modelines
set colorcolumn=80
set cursorline
set wildmenu
set wildignore+=*.pyc,*.obj,.git

" Used together, number is on current line while relative on all others
set number
set relativenumber

set tabstop=4
set shiftwidth=4    " shift four at a time with > <
set softtabstop=4   " backspace 4 spaces at a time
set expandtab       " replace tabs with spaces

set hlsearch
set incsearch    " Show results while typing
set ignorecase
set smartcase    " smart disable ignore case
" set scrolloff=3

" link default yank buffer to x11 clipboard
" This should really be replaced with some custom
" commands and the x11 workaround below
set clipboard=unnamedplus

set foldmethod=marker

" }}}
" Keybindings {{{

let mapleader = ","
nmap <Space> :w<CR>

nmap <leader>src :source $MYVIMRC<CR>
nmap <leader>erc :e $MYVIMRC<CR>

nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>
nmap <leader>l :set list!<CR>

nmap <C-h> :bn<CR>
nmap <C-l> :bp<CR>
nmap <C-j> :bfirst<CR>
nmap <C-k> :b#<CR>
" close current buffer without closing the window
nmap <leader>c :bp\|bd #<CR>

"}}}
" ----- x11 clipboard workaround {{{
" from tarruda: https://github.com/neovim/neovim/issues/583

function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

"vnoremap <silent> y y:call ClipboardYank()<cr>
"vnoremap <silent> d d:call ClipboardYank()<cr>
"nnoremap <silent> p :call ClipboardPaste()<cr>p
"onoremap <silent> y y:call ClipboardYank()<cr>
"onoremap <silent> d d:call ClipboardYank()<cr>
" }}}

syntax on
filetype plugin indent on
