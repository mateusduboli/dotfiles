"	{{{ Global Mappings
"	=> Define new leader
let mapleader = ' '
"	=> Disable F1
map <F1> <NOP>
"	=> Disable Q
map Q <NOP>
"	=> Arrows move between screen lines
map <Up> gk
map <Down> gj
" }}}

" {{{ Leader mappings
" => Save with w
noremap <leader>w :write<CR>
" " =>  Make
nmap <Leader>m :make<CR>
"   =>  Toggles NERDTree
map <Leader>t :NERDTreeToggle<CR>
" }}}

" vim:foldmethod=marker
