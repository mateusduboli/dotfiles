" =>  Remove tmux default mappings
let g:tmux_navigator_no_mappings = 1

noremap <silent> <c-b>l :TmuxNavigateRight<cr>
noremap <silent> <c-b>k :TmuxNavigateUp<cr>
noremap <silent> <c-b>j :TmuxNavigateDown<cr>
noremap <silent> <c-b>h :TmuxNavigateLeft<cr>
noremap <silent> <c-b>w :TmuxNavigatePrevious<cr>
