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
Plugin 'scrooloose/nerdtree'
"	=> Surround characters utilities
Plugin 'tpope/vim-surround'
"	=> Enhanced Status Bar
Plugin 'bling/vim-airline'
"	=> Syntastic
Plugin 'scrooloose/syntastic'
"	=> Git for Vim
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'
"	=> Color schemes
Plugin 'tomasr/molokai'

"   => Fuzzy file finder
Plugin 'kien/ctrlp.vim'

"   => Scala plugins
Plugin 'derekwyatt/vim-scala'
Plugin 'derekwyatt/vim-sbt'
"   => Tmux plugins
Plugin 'edkolev/tmuxline.vim'

"   => Json plugins
Plugin 'leshill/vim-json'
