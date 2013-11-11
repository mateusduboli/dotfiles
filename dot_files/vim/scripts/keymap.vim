"	=> Disable Arrowkeys

no <Down> gj
no <Up> gk
no <Left> <Nop>
no <Right> <Nop>

ino <Down> <Nop>
ino <Up> <Nop>
ino <Left> <Nop>
ino <Right> <Nop>

" {{{ OmniCompletition 
"	=> Map Ctrl-Space to completition
ino <expr> <C-@> pumvisible() ? '<C-N>' : '<C-X><C-O>'
"	=> Makes enter to hide the option menu
ino <expr> <CR> pumvisible() ? '<C-Y>' : '<CR>'
" }}}

" {{{ File navigation
" }}}
