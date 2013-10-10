"""""""""""""""""""""""""""""""""""""""""
"	Mateus's VIMrc file
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
"	=>	Vundle Configuration
"""""""""""""""""""""""""""""""""""""""""

"	=> Startup configs
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"	=> Vundle Bundle
Bundle 'gmarik/vundle'

Bundle 'Wombat'
Bundle 'The-NERD-tree' 
Bundle 'Conque-Shell'
Bundle 'surround.vim'

nmap <F4> :NERDTree<CR>
nmap <F3> <c-w>f <c-w>l
