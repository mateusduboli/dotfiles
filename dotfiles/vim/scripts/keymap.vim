" {{{ ArrowKeys
"	=> Up and Down move in screen lines
noremap <Down> gj
noremap <Up> gk
"	=> Disable Arrowkeys
noremap <Left> <Nop>
noremap <Right> <Nop>

inoremap <Down> <Nop>
inoremap <Up> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
" }}}

" {{{ LineManipulation
"	=> Join lines upward
noremap K kJ
"	=> Open newline without entering Insertmode
nmap o o<ESC>
"	=> Open newline upward without entering Insertmode
nmap O O<ESC>
"}}}

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
noremap <F3> <C-W>f <C-W>H
"	}}}

" {{{ Tagbar
"	=> Toggle tagbar
nmap <C-T> :TagbarToggle<CR>
" }}}

" {{{ Make
nmap <F2> :make run<CR>
" }}}


" vim:foldmethod=marker
