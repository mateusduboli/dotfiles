" =>  Remove tmux default mappings
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-b>l :TmuxNavigateRight<cr>
nnoremap <silent> <c-b>k :TmuxNavigateUp<cr>
nnoremap <silent> <c-b>j :TmuxNavigateDown<cr>
nnoremap <silent> <c-b>h :TmuxNavigateLeft<cr>
nnoremap <silent> <c-b>w :TmuxNavigatePrevious<cr>

