"""""""""""""""""""""""""""""""""""""""""
"	Mateus's VIMrc file
"""""""""""""""""""""""""""""""""""""""""

set nocompatible

"""""""""""""""""""""""""""""""""""""""""
"	=>	Scripts
"""""""""""""""""""""""""""""""""""""""""
"	=> Load Vim Bundles
source ~/.vim/scripts/vundles.vim
"	=> Base configuration for all languages
source ~/.vim/scripts/base.vim
"	=> Scala settings
source ~/.vim/scripts/scala.vim

"""""""""""""""""""""""""""""""""""""""""
"	=>	User interface	
"""""""""""""""""""""""""""""""""""""""""

"	=>	Always show current position
set ruler

"""""""""""""""""""""""""""""""""""""""""
"	=>	Style settings
"""""""""""""""""""""""""""""""""""""""""

"	=> Omnicompletition
set omnifunc=syntaxcomplete#Complete

"	=>	Color scheme
colorscheme wombat
set background=dark

"	=> Syntax highlighting
syntax on

"	=>	Tab settings	
set smarttab
set shiftwidth=4
set tabstop=4

"	=>	Linebreak on 500 characters
set lbr
set tw=500

"	=> Set Backspace over indent, lines and start
set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""
"	=>	Files, backup and ignores
"""""""""""""""""""""""""""""""""""""""""

"	=>	Ignore compiled files
set wildignore=*.o,*~,*.pyc

"	=> No backup
set nobackup
set nowb
set noswapfile

"	=> AMPL file associations
au BufNewFile,BufRead *.dat set filetype=ampl
au BufNewFile,BufRead *.mod set filetype=ampl

"	=> Start plugins for each filetype
filetype plugin on

"	=> Set auto indent on start
filetype indent on

"	=>	KeyboadShortcuts
source ~/.vim/scripts/keymap.vim
