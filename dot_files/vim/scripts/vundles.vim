"""""""""""""""""""""""""""""""""""""""""
"	Mateus's VIMrc file
"""""""""""""""""""""""""""""""""""""""""

"	=> Startup configs
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"	=> Vundle Bundle
Bundle 'gmarik/vundle'

"	=> Colortheme
Bundle 'Wombat'
"	=> Directory browser
Bundle 'The-NERD-tree' 
"	=> Shell inside vim
Bundle 'Conque-Shell'
"	=> Surround caracters utilities
Bundle 'surround.vim'
"	=> Enhanced Status Bar
Bundle 'bling/vim-airline'
"	=> Vim Outline
Bundle 'Tagbar'
"	=> Git repository manager
Bundle 'fugitive.vim'
"	=> Syntastic
Bundle 'Syntastic'
