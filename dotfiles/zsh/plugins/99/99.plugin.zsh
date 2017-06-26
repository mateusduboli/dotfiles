## 99 bindings
99_PROJECT_HOME="$HOME/Dev/Podcaster"

function _cd_99() {
  for project in $99_PROJECT_HOME/*; do
    compadd "$(basename $project)"
  done
}

function cd_99() {
  PROJECT="$1"
  cd $99_PROJECT_HOME/$PROJECT
}

function gcl_99() {
  PROJECT="$1"
  git checkout git@github.com:99Taxis/$PROJECT
}

compdef _cd_99 cd_99
