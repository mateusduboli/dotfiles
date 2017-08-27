#!/bin/bash
#vim:et:sw=2
source setup.cfg
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

  if [[ ! -e $(basename $DST) ]]; then
    echo "Creating '.config' directory"
    mkdir -p $(basename $DST)
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

function safe_link {
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

append_help "zsh" "Installs oh-my-zsh and link my custom folder."
function install_zsh {
  if check_executable 'zsh'; then
    if [[ ! -d "$ANTIGEN_HOME" ]]; then
      mkdir -p "$ANTIGEN_HOME"
    fi
    if [[ ! -e "$ANTIGEN_SCRIPT" ]]; then
      curl -L --progress-bar "$ANTIGEN_URL" > $ANTIGEN_SCRIPT
    else
      echo "antigen already installed."
    fi
    safe_link 'antigenrc'
    safe_link 'zshrc'
    safe_link 'zsh'
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
  if [[ $IS_OSX ]]; then
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
  if  check_executable 'fc-cache' ; then
    IFS=$(printf '\t\n\r')
    for FONT in $FONT_SRC; do
      cp "$FONT" "$FONT_DST/$FONT"
    done
    if [[ ! -d "$FONT_DST" ]]; then
      echo "Create $FONT_DST directory"
      mkdir -p "$FONT_DST"
    fi
    fc-cache "$FONT_DST"
  fi
}

append_help "git" "Links my gitconfig."
function install_git {
  if  check_executable 'git' ; then
    safe_link 'gitconfig'
    safe_link 'git-commit-template.txt'
  fi
}

append_help "tmux" "Links tmux.conf"
function install_tmux {
  if  check_executable 'tmux' ; then
    safe_link 'tmux.conf'
  fi
}

append_help "iterm" "Links and configure iterm configuration"
function install_iterm {
  echo "Using .iterm folder as iterm configuration"
  safe_link "iterm"
  defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.iterm"
  defaults write com.googlecode.iterm2.plist LoadPrefsCustomFolder -bool true
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
}

function os_opts {
  case "$(uname)" in
    'Linux')
      LN_OPTS='-sfi'
      FONT_DST="$HOME/.fonts"
      IS_OSX=false
      ;;
    'Darwin')
      LN_OPTS='-shi'
      FONT_DST="$HOME/Library/Fonts"
      IS_OSX=true
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
  'iterm')
    install_iterm
    ;;
  'all')
    install_all
    ;;
  *)
    show_help
    ;;
esac
exit 0
