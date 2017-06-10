"""""""""""""""""""""""""""""""""""""""""
"	Mateus's VIMrc file
"""""""""""""""""""""""""""""""""""""""""

call plug#begin()

"	=> Directory browser
Plug 'scrooloose/nerdtree'

"	=> Enhanced Status Bar
Plug 'bling/vim-airline'

"	=> Syntastic
Plug 'scrooloose/syntastic'

"	=> Git for Vim
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

"	=> Color schemes
Plug 'tomasr/molokai'

"   => Fuzzy file finder
Plug 'kien/ctrlp.vim'

"   => Java plugins
Plug 'tpope/vim-classpath'

"   => Scala plugins
Plug 'derekwyatt/vim-scala'
Plug 'derekwyatt/vim-sbt'

"   => Tmux
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'

"   => Json
Plug 'leshill/vim-json'

"   => Octave
Plug 'jvirtanen/vim-octave'

"   => Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

"   => Graddle
Plug 'tfnico/vim-gradle'

"   => Ruby
Plug 'ngmy/vim-rubocop'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'

" => Golang
Plug 'fatih/vim-go'

"   => Typescript
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'

"   => Clojure
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-static'
Plug 'venantius/vim-eastwood'
Plug 'venantius/vim-cljfmt'

"   => Ionic
Plug 'akz92/vim-ionic2'

"   => Miscelaneous
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'ntpeters/vim-better-whitespace'

call plug#end()
