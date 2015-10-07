if exists("current_compiler")
	finish
endif
let current_compiler = "maven"

CompilerSet makeprg=mvn
CompilerSet errorformat=
	\\[ERROR\]%f:%l:\ %m,%-G%.%#,
	\\[ERROR\]%m
