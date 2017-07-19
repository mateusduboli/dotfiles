#!/bin/zsh
# vim: ft=zsh
function prepend_path {
  export PATH="$1:$PATH"
}

function append_path {
  export PATH="$PATH:$1"
}

function append_multiple_paths {
  PATHS="$1"
  DELIMITER="${2:-':'}"

  for SUBPATH in $(echo "$PATHS" | tr "$DELIMITER" ' '); do
    append_path "$SUBPATH"
  done
}

function prepend_multiple_paths {
  PATHS="$1"
  DELIMITER="${2:-':'}"

  for SUBPATH in $(echo "$PATHS" | tr "$DELIMITER" ' '); do
    prepend_path "$SUBPATH"
  done
}
