set nocompatible

" Vundle config section
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'AndrewRadev/linediff.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ciaranm/detectindent'
Plugin 'fatih/vim-go'
Plugin 'kana/vim-fakeclip'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'

call vundle#end()
filetype plugin indent on

" END Vundle config section

syntax on

highlight StatusLine   term=bold,reverse cterm=NONE ctermbg=Blue ctermfg=LightGray
highlight StatusLineNC term=reverse cterm=NONE ctermbg=Blue ctermfg=DarkGray

set backspace=indent,eol,start
set directory=~/.vim/swap//,.
set laststatus=2
set list
set listchars=tab:\|\ ,trail:·
set nohlsearch
set noincsearch
set path+=**
set ruler
set scrolloff=5
set showcmd
set smarttab autoindent
set splitright splitbelow
set switchbuf=usetab
set ttimeoutlen=100
set wildmenu
set wildmode=longest,list,full

set cscopetag
set cscopetagorder=0
set nocsverb
" add any database in current directory
if filereadable("cscope.out")
  cs add $PWD/cscope.out
" else add database pointed to by environment
elseif $CSCOPE_DB != ""
  cs add $CSCOPE_DB
endif
map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>

command -nargs=0 -count Spaces :let &tabstop=(<count> ? <count> : 2) | let &shiftwidth=(<count> ? <count> : 2) | set expandtab
command -nargs=0 -count Tabs   :let &tabstop=(<count> ? <count> : 4) | let &shiftwidth=(<count> ? <count> : 4) | set noexpandtab
Spaces 2

command -nargs=* Make wall | execute 'silent make <args>' | redraw! | cc

cabbrev help abo help

nnoremap ,, ,
nmap ,o o<CR>
nmap ,O O<Esc>O
map Y y$
vmap s :s

nmap <C-N> :next<CR>
nmap <C-P> :prev<CR>

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

nmap <C-Q> :q<CR>
nmap QQ :confirm quitall<CR>
nmap QW :confirm wqall<CR>

nmap <C-S> <C-A>

nmap <Up> <C-W>+
nmap <Down> <C-W>-
nmap <Left> <C-W><
nmap <Right> <C-W>>

"set colorcolumn=81
"highlight ColorColumn  ctermbg=darkblue

command -nargs=0 AntMake :set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%# | set makeprg=ant\ compile
command -nargs=0 Javac :set makeprg=javac\ *.java
