if exists('g:loaded_airline')
	" enable automatic population of the `g:airline_symbols` dictionary with powerline symbols.
	if has('gui_running')
		" powerline symbols
		let g:airline_powerline_fonts=1
		if !exists('g:airline_symbols')
			let g:airline_symbols = {}
		endif
		let g:airline_left_sep = ''
		let g:airline_left_alt_sep = ''
		let g:airline_right_sep = ''
		let g:airline_right_alt_sep = ''
		let g:airline_symbols.branch = ''
		let g:airline_symbols.readonly = ''
		let g:airline_symbols.linenr = ''
	endif
endif
