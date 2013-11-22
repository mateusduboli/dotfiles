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
Bundle 'wombat256.vim'
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
"	=> Syntastic
Bundle 'Syntastic'
if v:version > 730
	"	=> YouCompleteMe
	Bundle 'Valloric/YouCompleteMe'
endif
