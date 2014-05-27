set nocompatible

" Vundle config section
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kana/vim-fakeclip'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'ciaranm/detectindent'

call vundle#end()
filetype plugin indent on

" END Vundle config section

syntax on

highlight StatusLine   term=bold,reverse cterm=NONE ctermbg=Blue ctermfg=LightGray
highlight StatusLineNC term=reverse cterm=NONE ctermbg=Blue ctermfg=DarkGray

set laststatus=2
set smarttab autoindent
set listchars=tab:\|\ ,trail:·
set list
set nohlsearch
set noincsearch
set wildmenu
set wildmode=longest,list,full
set ttimeoutlen=100
set showcmd

command -nargs=0 -count Spaces :let &tabstop=(<count> ? <count> : 2) | let &shiftwidth=(<count> ? <count> : 2) | set expandtab
command -nargs=0 -count Tabs   :let &tabstop=(<count> ? <count> : 4) | let &shiftwidth=(<count> ? <count> : 4) | set noexpandtab
Spaces 2

command -nargs=* Make execute 'silent make <args>' | redraw! | cc

nnoremap ,, ,
nmap ,o o<CR>
nmap ,O O<Esc>O
map Y y$
vmap s :s

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nmap <C-N> :next<CR>
nmap <C-P> :prev<CR>

nmap <C-Q> :q<CR>
nmap QQ :confirm quitall<CR>
nmap QW :confirm wqall<CR>

"au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"command -nargs=0 NoHighlight :call matchdelete(w:m2)

" This needs to be split out
augroup filetype
  au BufRead,BufNewFile *.flex,*.jflex set filetype=jflex
  au BufRead,BufNewFile *.cup set filetype=cup
augroup END
au Syntax jflex so ~/.vim/syntax/jflex.vim
command -nargs=0 AntMake :set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%# | set makeprg=ant\ compile
command -nargs=0 Javac :set makeprg=javac\ *.java
