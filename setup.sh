#!/bin/bash
#vim:et:sw=2

BASE=$(realpath $(dirname $0))
source ${BASE}/setup.cfg

HELP="Commands\n"

function append_help {
  COMMAND="$1"
  MESSAGE="$2"
  HELP+=$(printf '%-20s %s' "$COMMAND" "$MESSAGE")
  HELP+="\n"
}

append_help "usage" "Prints this text."
function show_help {
  echo -ne "$HELP"
}

function backup_file {
  local DST=$1
  local BAK="$BACKUP/$FILENAME"
  echo "Backing up $DST to $BAK"
  mv "$DST" "$BAK"
}

function link_to_config {
  local FILENAME=$1
  local SRC="$DOT_FILES/$FILENAME"
  local DST="$HOME/.config/$FILENAME"

  if [[ ! -e $(dirname $DST) ]]; then
    echo "Creating '.config' directory"
    mkdir -p $(dirname $DST)
  fi
  if [[ -L "$DST" ]] && [[ "$(readlink "$DST")" == "$SRC" ]]; then
    echo "Link to $DST already made"
    return
  fi
  if [[ -e "$DST" ]] && [[ ! -L "$DST" ]]; then
    backup_file "$DST"
  fi
  echo "Linking $SRC to $DST"
  ln "$LN_OPTS" "$SRC" "$DST"
}

function link_to_home {
  local FILENAME=$1
  local SRC="$DOT_FILES/$FILENAME"
  local DST="$HOME/.$FILENAME"

  if [[ -L $DST ]] && [[ "$(readlink "$DST")" == "$SRC" ]]; then
    echo "Link to $DST already made"
    return
  fi
  if [[ -e $DST ]] && [[ ! -L $DST ]]; then
    backup_file "$DST"
  fi
  echo "Linking $SRC to $DST"
  ln "$LN_OPTS" "$SRC" "$DST"
}

function check_executable {
  local COMMAND=$1

  echo "Checking $COMMAND"
  which "$COMMAND" &> /dev/null
  if [[ $? == 0 ]]; then
    return 0
  else
    echo "First install $COMMAND."
    return 1
  fi
}

append_help "zsh" "Installs antigen and link my custom folder."
function install_zsh {
  if check_executable 'zsh'; then
    if [[ ! -d "$ANTIGEN_HOME" ]]; then
      git clone "$ANTIGEN_URL" "$ANTIGEN_HOME"
    else
      echo "antigen already installed."
    fi
    link_to_home 'antigenrc'
    link_to_home 'zshrc'
    link_to_home 'zsh'
  fi
}

append_help "nvim-plugged" "Installs nvim-plugged and the plugins"
function install_nvim_plugged {
  if [[ ! -f "$VIM_PLUG_FILE" ]]; then
    curl -fLo "$VIM_PLUG_FILE" --create-dirs "$VIM_PLUG_URL"
    echo "vim-plug installed."
  else
    echo "vim-plug already installed."
  fi
  nvim +PlugInstall +qa
}

append_help "nvim" "Checks for nvim installation, link the config folders and install nvim-plugged"
function install_nvim {
  if check_executable 'nvim'; then
    link_to_config 'nvim'
    install_nvim_plugged
  fi
}

append_help "fonts" "Copy 'Source Code Pro For Powerline' to $FONT_DST, and runs fcache"
function install_fonts {
  if [[ ${OS_NAME} -eq "osx" ]]; then
    install_fonts_osx
  else
    install_fonts_linux
  fi
}

function install_fonts_osx {
  IFS=$(printf '\t\n\r')
  for FONT in $FONT_SRC/*; do
    FONT=$(basename $FONT)
    cp "$FONT_SRC/$FONT" "$FONT_DST/$FONT"
  done
}

function install_fonts_linux {
  if check_executable 'fc-cache'; then
    IFS=$(printf '\t\n\r')
    if [[ ! -d "${FONT_DST}" ]]; then
      echo "Create ${FONT_DST} directory"
      mkdir -p "${FONT_DST}"
    fi
    for FONT in ${FONT_SRC}/*; do
      FONT=$(basename ${FONT})
      cp "${FONT_SRC}/${FONT}" "${FONT_DST}/${FONT}"
    done
    fc-cache "${FONT_DST}"
  fi
}

append_help "git" "Links my gitconfig."
function install_git {
  if check_executable 'git' ; then
    link_to_home 'gitconfig'
    link_to_home 'git-commit-template.txt'
  fi
}

append_help "tmux" "Links tmux.conf"
function install_tmux {
  if check_executable 'tmux' ; then
    link_to_config 'tmux.conf'
  fi
  install_tpm

  if [[ ${OS_NAME} == 'linux' ]]; then
    echo "Installing tmux systemd service"
    if [[ ! -d "${SYSTEMD_USER_HOME}" ]]; then
        mkdir -p ${SYSTEMD_USER_HOME}
    fi
    cp ${SYSTEMD_UNIT_SRC}/tmux.service ${SYSTEMD_USER_HOME}/tmux.service
    systemctl daemon-reload
    systemctl --user enable tmux.service
    systemctl --user start tmux.service
  fi
}

function install_tpm {
  if [[ ! -d "$TPM_HOME" ]]; then
    echo 'Installing tpm'
    git clone https://github.com/tmux-plugins/tpm "$TPM_HOME"
  fi

  tmux run-shell "$TPM_HOME/bindings/install_plugins"
}
append_help "terminal" "Links and configure the systems terminal configuration"
function install_terminal {
  if [[ "${DEFAULT_TERMINAL}" == 'iterm' ]]; then
    echo "Using .iterm folder as iterm configuration"
    link_to_home "iterm"
    defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.iterm"
    defaults write com.googlecode.iterm2.plist LoadPrefsCustomFolder -bool true
  elif [[ "${DEFAULT_TERMINAL}" == 'gnome-terminal' ]]; then
    ${HELPERS}/gnome-terminal.sh
  else
  	echo "No terminal configured"
  fi
}

append_help "keyboard" "Configures the keyboard"
function install_keyboard {
  if ! which localectl 2>&1 > /dev/null; then
    echo "Could not find localectl in the system"
    return 1
  fi
  
  localectl --no-convert set-x11-keymap us,us pc105 intlm 'lv3:ralt_switch,caps:escape,terminate:ctrl_alt_bksp'
  localectl --no-convert set-keymap us-acentos
  
  if [[ ${DESKTOP_SESSION} == 'gnome' ]]; then
    gsettings set 'org.gnome.desktop.input-sources' xkb-options '["lv3:ralt_switch", "caps:escape", "terminate:ctrl_alt_bksp"]'
  fi
}

append_help "all" "Runs all the above."
function install_all {
  echo "Installing all."
  install_zsh
  install_nvim_plugged
  install_nvim
  install_fonts
  install_tmux
  install_git
  install_terminal
  install_keyboard
}

function os_opts {
  case "$(uname)" in
    'Linux')
      LN_OPTS='-sfi'
      FONT_DST="$HOME/.fonts"
      OS_NAME='linux'
      DEFAULT_TERMINAL='gnome-terminal'
      ;;
    'Darwin')
      LN_OPTS='-shi'
      FONT_DST="$HOME/Library/Fonts"
      OS_NAME='osx'
      DEFAULT_TERMINAL='iterm'
      ;;
  esac
}

os_opts
mkdir "$BACKUP" 2>/dev/null
case "$1" in
  'zsh')
    install_zsh
    ;;
  'nvim')
    install_nvim
    ;;
  'nvim-plugged')
    install_nvim_plugged
    ;;
  'fonts')
    install_fonts
    ;;
  'git')
    install_git
    ;;
  'tmux')
    install_tmux
    ;;
  'terminal')
    install_terminal
    ;;
  'keyboard')
    install_keyboard
    ;;
  'all')
    install_all
    ;;
  *)
    show_help
    ;;
esac
exit 0
