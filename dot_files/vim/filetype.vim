if exists("did_load_filetypes")
	finish
endif
augroup filetypedetect
	" AMPL Filetype
	autocmd BufRead,BufNewFile *.mod setfiletype ampl
	autocmd BufRead,BufNewFile *.dat setfiletype ampl
	" Scala Filetype
	autocmd BufRead,BufNewFile *.scala setfiletype scala
augroup END
