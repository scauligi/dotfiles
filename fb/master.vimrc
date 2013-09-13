"
" facebook-specific
"

" please uncomment this next line in your personal ~/.vimrc:
"source $ADMIN_SCRIPTS/master.vimrc

" this keeps you up-to-date with the latest master.vimrc changes; if you opt
" not to, you'll be on your own for keeping up with general changes

if $ADMIN_SCRIPTS == ""
  let $ADMIN_SCRIPTS = "/mnt/vol/engshare/admin/scripts"
endif

set runtimepath+=$ADMIN_SCRIPTS/vim

set nocompatible

set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

" error log, hzhao's nemo
" TODO: can we make these more specifically depend on the error file
"   (like only 'vim -q blah.nemo' would try the nemo errorformat)
set errorformat+=%.%#PHP:\ %m\ \(in\ %f\ on\ line\ %l\)%.%#,
  \%E%[0-9]%#.%m:%f?rev=%.%##L%l\ %.%#,%C%.%#

" automatically load svn-commit template
if $SVN_COMMIT_TEMPLATE == ""
  let $SVN_COMMIT_TEMPLATE = "$ADMIN_SCRIPTS/templates/svn-commit-template.txt"
endif
autocmd BufNewFile,BufRead svn-commit.*tmp :0r $SVN_COMMIT_TEMPLATE

"
" general
"

set nocompatible

set tags=tags;/

" searching
set incsearch                 " incrimental search
set hlsearch                  " highlighting when searching

" this should get best indenting for most common filetypes
filetype indent plugin on
" note: cindent and smartindent do the wrong thing with e.g. indented lines
" starting with # in certain files.
" so i think autoindent is more minimal and good default for all filetypes.
" again, most files will be covered by the previous line.
set autoindent

set backspace=2

" display
set nolist                    " show/hide tabs and EOL chars
set nonumber                  " show/hide line numbers (nu/nonu)
set scrolloff=5               " scroll offsett, min lines above/below cursor
set scrolljump=5              " jump 5 lines when running out of the screen
set sidescroll=10             " minumum columns to scroll horizontally
set showcmd                   " show command status
set showmatch                 " flashes matching paren when one is typed
set showmode                  " show editing mode in status (-- INSERT --)
set ruler                     " show cursor position

" other
set noerrorbells              " no bells in terminal
set undolevels=1000           " number of undos stored
set viminfo='50,"50           " '=marks for x files, "=registers for x files

"
" things you may be interested in for your .vimrc
"

" highlight literal tabs
" (but don't highlight trailing whitespace; it's annoying as you type)
" actually even tabs are annoying since they are in e.g. git commit msgs
" could make it just for php but i'm not sure it's even needed
"match Error '\t'

" make split windows easier to navigate
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-h> <C-w>h
"map <C-l> <C-w>l
"map <C-m> <C-w>_

" bind "gb" to "git blame" for visual and normal mode.
:vmap gb :<C-U>!git blame % -L<C-R>=line("'<") <CR>,<C-R>=line("'>") <CR><CR>
:nmap gb :!git blame %<CR>
