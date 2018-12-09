"""""""""""""""""""""""""""""""""""""""""
"	Mateus's VIMrc file
"""""""""""""""""""""""""""""""""""""""""

call plug#begin()
"   => Sensitive defaults
Plug 'tpope/vim-sensible'

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
Plug 'noahfrederick/vim-noctu'

"   => Fuzzy file finder
Plug 'kien/ctrlp.vim'

"   => Json
Plug 'leshill/vim-json'

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
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

"   => Typescript
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'

"   => Ionic
Plug 'akz92/vim-ionic2', { 'for': 'html' }

"   => Rust
Plug 'rust-lang/rust.vim'

"   => Tmux
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'

"   => Miscelaneous
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'puppetlabs/puppet-syntax-vim'


call plug#end()
