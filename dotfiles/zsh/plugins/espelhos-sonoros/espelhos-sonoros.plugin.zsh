## Espelhos Sonoros bindings
ESPELHOS_SONOROS_HOME="$HOME/Dev/EspelhosSonoros"

function _cd_espelhos() {
  for project in $ESPELHOS_SONOROS_HOME/*; do
    compadd "$(basename $project)"
  done
}

function cd_espelhos() {
  PROJECT="$1"
  cd $ESPELHOS_SONOROS_HOME/$PROJECT
}

compdef _cd_espelhos cd_espelhos
