#!/bin/bash
# vim:et:sw=4
source setup.cfg
HELP="Commands\n"
LN_OPTS='-s'

function append_help {
  HELP+="$1\t\t$2\n"
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

function safe_copy {
  local DIRECTORY=$1
  local FILENAME=$2

  local SRC="$PWD/$DIRECTORY/$FILENAME"
  local DST_DIR="$HOME/.$DIRECTORY"
  local DST="$DST_DIR/$FILENAME"

  if [[ ! -d $DST_DIR ]]; then
    echo "Creating $DST_DIR."
    mkdir -p "$DST_DIR"
  fi

  if [[ ! -e $DST ]]; then
    echo "Copying $SRC to $DST"
    cp  "$SRC" "$DST"
  else
    echo "$DST already there."
  fi
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
    if [[ ! -e "$OH_MY_ZSH_HOME" ]]; then
      curl -L --progress-bar "$OH_MY_ZSH_URL" | sh
    else
      echo "oh-my-zsh already installed."
    fi
    safe_link 'zshrc'
    safe_link 'zsh'
    safe_link 'zsh.alias'
  fi
}

function install_nvim_vundle {
  if [[ ! -e "$VUNDLE_HOME" ]]; then
    git clone "$VUNDLE_URL" "$VUNDLE_HOME"  >/dev/null
    echo "Vundle installed."
  else
    echo "Vundle already installed."
  fi
  nvim +PluginInstall +qa
}

append_help "nvim" "Installs vundle, install my plugins and link my nvimrc and my nvim folder"
function install_nvim {
  if  check_executable 'nvim' ; then
    link_to_config 'nvim'
    install_nvim_vundle
  fi
}

function install_nvim_vundle {
  if [[ ! -e "$VUNDLE_HOME" ]]; then
    git clone "$VUNDLE_URL" "$VUNDLE_HOME"  >/dev/null
    echo "Vundle installed."
  else
    echo "Vundle already installed."
  fi
  nvim +PluginInstall +qa
}

append_help "fonts" "Copy 'Source Code Pro For Powerline' to .fonts, and runs fcache"
function install_fonts {
  if  check_executable 'fc-cache' ; then
    IFS=$(printf '\t\n\r')
    for FONT in $FONT_DIR; do
      safe_copy "$FONT_DIR" "$FONT"
    done
    fc-cache "$HOME/.fonts"
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
    if check_executable 'mux' ; then
      echo "Installing tmuxnator"
      gem install tmuxinator
    else
      echo "Tmuxinator already installed"
    fi
  fi

}

append_help "rvm" "Install rvm, the ruby version manager"
function install_rvm {
  if  check_executable 'rvm' ; then
    gpg --keyserver "$RVM_KEYSERVER" \
      --recv-keys "$RVM_KEYID"
    curl -sSL https://get.rvm.io | bash
  fi
}

append_help "all" "Runs all the above."
function install_all {
  echo "Installing all."
  install_zsh
  install_nvim
  install_fonts
  install_tmux
  install_rvm
  install_git
}

function os_opts {
  case "$(uname)" in
    'Linux')
      LN_OPTS='-sfi'
      ;;
    'Darwin')
      LN_OPTS='-shi'
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
  'fonts')
    install_fonts
    ;;
  'git')
    install_git
    ;;
  'tmux')
    install_tmux
    ;;
  'rvm')
    install_rvm
    ;;
  'all')
    install_all
    ;;
  *)
    show_help
    ;;
esac
exit 0
