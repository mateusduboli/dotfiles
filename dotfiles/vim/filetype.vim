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
	" sh files will be zsh
	autocmd Filetype sh setfiletype zsh	
	" VagrantFile as ruby file
	autocmd BufRead,BufNewFile VagrantFile setfiletype ruby
augroup END
" Default LaTeX flavor
let g:tex_flavor = "latex"

