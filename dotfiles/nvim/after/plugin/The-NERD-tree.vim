if exists('g:loaded_nerd_tree')
  " open bookmarks on startup
  let g:NERDTreeShowBookmarks=0
  " show linenumbers in NERDTree
  let NERDTreeShowLineNumbers=1
  " disable the '?' and the bookmarks label
  let NERDTreeMinimalUI=1
  " autochdir when navigating
  let NERDTreeChDirMode=2

  call add(NERDTreeIgnore, '__pycache__')
  call add(NERDTreeIgnore, '\.pyc$')
endif
