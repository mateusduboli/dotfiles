"""""""""""""""""""""""""""""""""""""""""
"	Mateus's VIMrc file
"""""""""""""""""""""""""""""""""""""""""

"	=> Startup configs
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"	=> Vundle Bundle
Plugin 'gmarik/vundle'

"	=> Directory browser
Plugin 'The-NERD-tree'
"	=> Surround characters utilities
Plugin 'surround.vim'
"	=> Enhanced Status Bar
Plugin 'bling/vim-airline'
"	=> Syntastic
Plugin 'Syntastic'
"	=> Git for Vim
Plugin 'fugitive.vim'
"	=> Color schemes
Plugin 'molokai'
