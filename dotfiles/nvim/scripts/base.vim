" => File Encoding
set encoding=utf8

" => Disable mouse interaction
set mouse=

" => Show linenumbers
set number

" => Enable Command-Mode completition
set wildmenu

" => First completes to longest, then list possibilities, then cycle through then
set wildmode=longest:list,full

" => Search smartcase
set ignorecase
set smartcase

" => Show current command
set showcmd

" => Hide current mode
set noshowmode

" => Always show status bar
set laststatus=2

" => Terminal settings
set t_Co=256

" => Enable syntax highlight
syntax on

" =>  Color scheme
colorscheme noctu

" => Read modeline values
set modelines=1

" => Dark background
set background=dark

" => Show unprinted characters
set list

" => Define characters display
set listchars=eol:¶,tab:»·,trail:·

" => Set the unnamed register to hold the system clipboard
set clipboard=unnamed

" => Completition Function
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menu

" =>  Tab settings
set smarttab
set shiftwidth=2
set tabstop=2

" =>  Use spaces instead of tabs
set expandtab

" =>  Break big lines to fit the screen (no EOL)
set linebreak

" => Reduce timeout for insert mode exit
set ttimeoutlen=50

" => Set Backspace over indent, lines and start
set backspace=indent,eol,start

" => No backup
set nobackup
set nowritebackup
set noswapfile

" => Enable filetype detection
filetype on
filetype plugin indent on
