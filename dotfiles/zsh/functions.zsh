#!/bin/zsh
# vim: ft=zsh
function prepend_path {
  export PATH="$1:$PATH"
}

function append_path {
  export PATH="$PATH:$1"
}
