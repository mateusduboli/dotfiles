"	{{{ Global Mappings
"	=> Define new leader
let mapleader = '/'
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
"   => Navigate between tabs
nmap <C-W>[ :tabp<CR>
nmap <C-W>] :tabn<CR>
"	}}}

"{{{ Screen centering
"   Center screen in current line with zm
noremap zm zz
"}}}
"
" {{{ Make
nmap <Leader>m :make<CR>
" }}}

" {{{ NERDTree
"   => <F4> Toggles NERDTree
map <Leader>t :NERDTreeToggle<CR>
" }}}

" {{{ Save with zz
noremap zz :write<CR>
" }}}

" {{{ Tmux window navigation
" => Unmap old navigation
map <C-W>h <Nop>
map <C-W>j <Nop>
map <C-W>k <Nop>
map <C-W>l <Nop>
" => Create tabs (or windows) like tmux
map <C-W>c :tabnew
" => Map to tmux navigation
noremap <silent> <C-a>h :TmuxNavigateLeft<cr>
noremap <silent> <C-a>j :TmuxNavigateDown<cr>
noremap <silent> <C-a>k :TmuxNavigateUp<cr>
noremap <silent> <C-a>l :TmuxNavigateRight<cr>
" }}}

" vim:foldmethod=marker
