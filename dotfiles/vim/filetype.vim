if exists("did_load_filetypes")
	finish
endif
augroup filetypedetect
	" AMPL Filetype
	autocmd BufRead,BufNewFile *.mod setfiletype ampl
	autocmd BufRead,BufNewFile *.dat setfiletype ampl
	" Scala Filetype
	autocmd BufRead,BufNewFile *.scala setfiletype scala
	" pom.xml compiler set
	autocmd BufRead,BufNewFile pom.xml compiler maven
	" QuickTask on vimtodo
	autocmd BufRead,BufNewFile .vimtodo setfiletype quicktask
augroup END
" tex files are now recognized as LaTeX
let g:tex_flavor = "latex"
