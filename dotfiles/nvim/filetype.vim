if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    " AMPL Filetype
    autocmd BufRead,BufNewFile *.mod setfiletype ampl
    autocmd BufRead,BufNewFile *.dat setfiletype ampl
    " pom.xml compiler set
    autocmd BufRead,BufNewFile pom.xml compiler maven
    autocmd BufRead,BufNewFile VagrantFile setfiletype ruby
    " markdown md
    autocmd BufRead,BufNewFile *.md setfiletype markdown
augroup END

" Default LaTeX flavor
let g:tex_flavor = "latex"
