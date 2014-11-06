"	{{{ Global Mappings
"	=> Define new leader
let mapleader = ' '
"	=> Disable F1
map <F1> <NOP>
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

" {{{ Tmux window navigation
" => Unmap old navigation
map <C-W>h <Nop>
map <C-W>j <Nop>
map <C-W>k <Nop>
map <C-W>l <Nop>

" => Window Navigation with square brackets
nmap <C-W>[ :tabprevious<CR>
nmap <C-W>] :tabnext<CR>

" => Create tabs (or windows) like tmux
map <C-W>c :tabnew<CR>

" => Map to tmux navigation
noremap <silent> <C-a>h :TmuxNavigateLeft<cr>
noremap <silent> <C-a>j :TmuxNavigateDown<cr>
noremap <silent> <C-a>k :TmuxNavigateUp<cr>
noremap <silent> <C-a>l :TmuxNavigateRight<cr>

" }}}

" vim:foldmethod=marker
