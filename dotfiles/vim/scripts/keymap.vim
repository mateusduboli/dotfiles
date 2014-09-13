"	{{{ Global Mappings
"	=> Disable F1
map <F1> <NOP>
"	=> Arrows move between screen lines
map <Up> gk
map <Down> gj
"	=> Disable the 's' character
map s <Nop>
"	=> Disable the 'S' character
map S <Nop>
" }}}

"	{{{	OmniCompletition
"	=> Map Ctrl-Space to completition
if has("gui")
	inoremap <expr> <C-Space> pumvisible() ? '<C-N>' : '<C-X><C-O>'
else
	inoremap <expr> <C-@> pumvisible() ? '<C-N>' : '<C-X><C-O>'
endif
"	=> Makes enter to hide the option menu
inoremap <expr> <CR> pumvisible() ? '<C-Y>' : '<CR>'
"	}}}

"	{{{File navigation
"	=> F3 Open file on cursor in new split
noremap <F3> <C-W>f <C-W>H
"   => Move between tabs with <C-W>[ and <C-W>]
noremap <silent> <C-w>[ :tabprevious<CR>
noremap <silent> <C-w>] :tabnext<CR>
"	}}}

" {{{ Make
nmap <F2> :make<CR>
" }}}

" {{{ NERDTree
"   => <F4> Toggles NERDTree
map <F4> :NERDTreeToggle<CR>
" }}}
" vim:foldmethod=marker
