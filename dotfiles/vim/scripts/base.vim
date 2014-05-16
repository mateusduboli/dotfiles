" {{{ Sidebar
"	=> Show linenumbers
set number
" }}}

" {{{ Command-Mode
"	=> Enable Command-Mode completition
set wildmenu
set wildmode=longest:list

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
"
set t_Co=256
"	=> Enable syntax highlight
syntax on
"	=>	Color scheme
let base16colorspace=256
colorscheme base16-monokai
"	=> Read modeline values
set modelines=1
"	=> Dark background
set background=dark
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
set shiftwidth=4
set tabstop=4
"	=>  Use spaces instead of tabs
set expandtab
"	=>	Break big lines to fit the screen (no EOL)
set linebreak
" }}}

" {{{ Formatting
"	=>	Break big lines to fit the screen (no EOL)
set linebreak
" }}}

" {{{ Startup
"	=> Open the todolist on startup
autocmd VimEnter * if argc() == 0 | edit ~/.vimtodo | | endif
" }}}

" {{{ Other Settings

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

"	=> File Encoding
set encoding=utf8
"

" vim:foldmethod=marker
