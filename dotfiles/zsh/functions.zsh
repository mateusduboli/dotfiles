#!/bin/zsh
function prependToPath {
	export PATH="$1:$PATH"
}

function appendToPath {
	export PATH="$PATH:$1"
}
