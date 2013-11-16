" {{{ Sidebar
"	=> Show linenumbers
set relativenumber
set number
" }}}

" {{{ Command-Mode
"	=> Enable Command-Mode completition
set wildmenu
set wildmode=longest:list

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
"	=> Set terminal colors to 256
set t_Co=256
"	=> Enable syntax highlight
syntax on
"	=>	Color scheme
colorscheme wombat256mod
"	=> Show non-printed characters
set list
"	=> Define characters display
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
set shiftwidth=4
set tabstop=4
"	=>	Break big lines to fit the screen (no EOL)
set linebreak
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
"	=>	Break big lines to fit the screen (no EOL)
set linebreak
" }}}

" vim:foldmethod=marker
