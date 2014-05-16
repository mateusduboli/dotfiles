"""""""""""""""""""""""""""""""""""""""""
"	Mateus's VIMrc file
"""""""""""""""""""""""""""""""""""""""""

"	=> Startup configs
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"	=> Vundle Bundle
Bundle 'gmarik/vundle'

"	=> Directory browser
Bundle 'The-NERD-tree'
"	=> Surround characters utilities
Bundle 'surround.vim'
"	=> Enhanced Status Bar
Bundle 'bling/vim-airline'
"	=> Syntastic
Bundle 'Syntastic'
"	=> Git for Vim
Bundle 'fugitive.vim'
"	=> Color schemes
Bundle 'chriskempson/base16-vim'
