set mouse=a
set number
set ruler
syn on
syntax on
filetype indent on
set backspace=indent,eol,start
filetype plugin on
set tabstop=4
set shiftwidth=4
set nobackup
au BufNewFile,BufRead *.dat set filetype=ampl
au BufNewFile,BufRead *.mod set filetype=ampl
