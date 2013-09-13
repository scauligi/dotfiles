set nocp
call pathogen#infect()
source $ADMIN_SCRIPTS/master.vimrc
source /home/engshare/admin/scripts/vim/biggrep.vim

highlight StatusLine   term=bold,reverse cterm=NONE ctermbg=Blue ctermfg=LightGray
highlight StatusLineNC term=reverse cterm=NONE ctermbg=Blue ctermfg=DarkGray

set laststatus=2
set listchars=tab:\|\ ,trail:·
set list
set nohlsearch
set noincsearch
set wildmenu
set wildmode=longest,list,full
set ttimeoutlen=100

command -nargs=0 Sess :Obsession `git rev-parse --abbrev-ref HEAD`.vim

nmap , ,,
nmap ,o o<CR>
nmap ,O O<Esc>O
map Y y$
vmap s :s

nmap QQ :confirm quitall<CR>
nmap QW :confirm wqall<CR>

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
