if exists('g:loaded_nerd_tree')
	" open bookmarks on startup
	let g:NERDTreeShowBookmarks=1
	" change NERDTreeBookmarks file to the .vim folder
	let g:NERDTreeBookmarksFile=expand('$HOME') . '/.vim/.NERDTreeBookmarks'
	" show linenumbers in NERDTree
	let NERDTreeShowLineNumbers=1
	" disable the '?' and the bookmarks label
	let NERDTreeMinimalUI=1
	" show arrows instead of the '+' and '-' signs
	if !has("gui_running")
		let NERDTreeDirArrows=0
	endif
endif
