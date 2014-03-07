set nocompatible
"call pathogen#infect()

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

cabbrev make set cmdheight=2 \| make \| set cmdheight=1

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

if has("autocmd")
  filetype plugin indent on
endif

command -nargs=0 AntMake :set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%# | set makeprg=ant\ compile
command -nargs=0 Javac :set makeprg=javac\ *.java
