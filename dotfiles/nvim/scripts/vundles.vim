"""""""""""""""""""""""""""""""""""""""""
"	Mateus's VIMrc file
"""""""""""""""""""""""""""""""""""""""""

"	=> Startup configs
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#rc("~/.config/nvim/bundle")

"	=> Vundle Bundle
Plugin 'VundleVim/Vundle.vim'

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

"   => Tmux
Plugin 'edkolev/tmuxline.vim'
Plugin 'christoomey/vim-tmux-navigator'

"   => Json
Plugin 'leshill/vim-json'

"   => Octave
Plugin 'jvirtanen/vim-octave'

"   => Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

"   => Graddle
Plugin 'tfnico/vim-gradle'

"   => NERDCommenter
Plugin 'scrooloose/nerdcommenter'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ngmy/vim-rubocop'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'

" => Golang
Plugin 'fatih/vim-go'
