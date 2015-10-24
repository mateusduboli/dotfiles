" { File encoding
"	=> File Encoding
set encoding=utf8
"}
" {{{ Sidebar
"	=> Show linenumbers
set number
" }}}

" {{{ Command-Mode
"	=> Enable Command-Mode completition
set wildmenu
" => First completes to longest, then list possibilities, then cycle through
" then
set wildmode=longest:list,full
" }}}

" {{{ Search
	"	=> Search smartcase
	set ignorecase
	set smartcase
" }}}

" {{{ Status bar
"	=> Show current command
set showcmd
"	=> Hide current mode
set noshowmode
"	=> Always show status bar
set laststatus=2
" }}}

" {{{ Syntax Highlighting
"   => Terminal settings
set t_Co=256
"	=> Enable syntax highlight
syntax on
"	=>	Color scheme
colorscheme molokai
"	=> Read modeline values
set modelines=1
"	=> Dark background
set background=dark
"   => Show unprinted characters
set list
"   => Define characters display
set listchars=eol:¶,tab:»·,trail:·
" }}}

" {{{ Registers
"	=> Set the unnamed register to hold the system clipboard
set clipboard=unnamed
" }}}

" {{{ Code completition
" => Completition Function
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menu
" }}}

" {{{ Indentation settings
"	=>	Tab settings
set smarttab
set shiftwidth=2
set tabstop=2
"	=>  Use spaces instead of tabs
set expandtab
"	=>	Break big lines to fit the screen (no EOL)
set linebreak
" }}}

" {{{ Other Settings
"  => Reduce timeout for insert mode exit
  set ttimeoutlen=50
"	=> Set Backspace over indent, lines and start
set backspace=indent,eol,start

"	=> No backup
set nobackup
set nowritebackup
set noswapfile

"	=> Enable filetype detection
filetype on
filetype plugin indent on

" }}}

" vim:foldmethod=marker
