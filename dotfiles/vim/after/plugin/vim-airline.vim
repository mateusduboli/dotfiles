if exists('g:loaded_airline')
  " enable automatic population of the `g:airline_symbols` dictionary with powerline symbols.
  let g:airline_powerline_fonts=1
  let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#whitespace#enabled = 0
  let g:airline_section_b = airline#section#create(['branch'])
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }
endif
