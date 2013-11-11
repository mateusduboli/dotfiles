"	=> Show linenumbers
set relativenumber
set number

"	=> Enable Command-Mode completition
set wildmenu
set wildmode=longest:list

"	=> Show current command
set showcmd

"	=> Hide current mode
set noshowmode

"	=> Always show status bar
set laststatus=2

"	=>	Color scheme
colorscheme wombat
set background=dark

"	=> Syntax highlighting
syntax on

"	=>	Tab settings	
set smarttab
set shiftwidth=4
set tabstop=4

"	=>	Linebreak on 500 characters
set linebreak

"	=> Set Backspace over indent, lines and start
set backspace=indent,eol,start

"	=> No backup
set nobackup
set nowritebackup
set noswapfile

"	=> Set auto indent and plugins for filetype
filetype plugin indent on

"	=> Set the unnamed register to hold the system clipboard
set clipboard=unnamed

" {{{ Code completition 
" => Completition Function
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menu
" }}}

" {{{ Non-printed characters
"	=> Show non-printed characters
set list
"	=> Define characters display
set listchars=eol:¶,tab:»·,trail:·
"	=> Set the color of the characters
highlight NonText ctermfg=LightGray guifg=LightGray
" }}}
