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
"	=> Surround characters utilities
Bundle 'surround.vim'
"	=> Enhanced Status Bar
Bundle 'bling/vim-airline'
"	=> Vim Outline
" Bundle 'Tagbar'
"	=> Syntastic
Bundle 'Syntastic'
"	=> Git for Vim

" Plugins that require a updated vim version
if v:version > 703
	"	=> YouCompleteMe
	"Bundle 'Valloric/YouCompleteMe'
endif
