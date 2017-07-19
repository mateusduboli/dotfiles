
function dcd() {
  function local_dcd() {
    local FOLDER="$1"

    for PROJECT in $FOLDER/*; do

    done
  }

  local DEV_FOLDER="$HOME/Dev"

  for FOLDER in $DEV_FOLDER/*; do
    local_dcd $FOLDER
  done
}


