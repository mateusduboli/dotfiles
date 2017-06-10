## Podcaster bindings
PODCASTER_PROJECT_HOME="$HOME/Dev/Podcaster"

function _cd_podcaster() {
  for project in $PODCASTER_PROJECT_HOME/*; do
    compadd "$(basename $project)"
  done
}

function cd_podcaster() {
  PROJECT="$1"
  cd $PODCASTER_PROJECT_HOME/$PROJECT
}

compdef _cd_podcaster cd_podcaster
