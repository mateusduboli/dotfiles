#!/bin/bash
# vim:et:sw=4
source setup.cfg
HELP="Commands\n"
LN_OPTS='-s'
OS=$(uname)

function append_help {
HELP+="$1\t\t$2\n"
}

append_help "usage" "Prints this text."
function show_help {
echo -ne "$HELP"
}

function backup_file {
  local FILENAME=$1
  local BAK="$BACKUP/$FILENAME"
  echo "Backing up $DST to $BAK"
  mv "$DST" "$BAK"
}

function link_to_config {
  local FILENAME=$1
  local SRC="$DOT_FILES/$FILENAME"
  local DST="$HOME/.config/$FILENAME"

  if [[ -L "$DST" ]] && [[ "$(readlink "$DST")" == "$SRC" ]]; then
    echo "Link to $DST already made"
    return
  fi
  if [[ -e "$DST" ]] && [[ ! -L "$DST" ]]; then
    backup_file "$FILENAME"
  fi
  echo "Linking $SRC to $DST"
  ln "$LN_OPTS" "$SRC" "$DST"
}

function safe_link {
filename=$1
src="$DOT_FILES/$filename"
dst="$HOME/.$filename"
if [[ -L $dst ]] && [[ "$(readlink "$dst")" == "$src" ]]; then
    echo "Link to $dst already made"
    return
fi
if [[ -e $dst ]] && [[ ! -L $dst ]]; then
    bak="$BACKUP/$filename"
    echo "Saving $dst to $bak"
    mv "$dst" "$bak"
fi
if [[ $OS == 'Linux' ]]; then
    if [[ -d $dst ]]; then
        bak="$BACKUP/$filename"
        echo "Saving $dst to $bak"
        mv "$dst" "$bak"
    fi
fi
echo "Linking $src to $dst"
ln $LN_OPTS "$src" "$dst"
}

function safe_copy {
directory=$1
filename=$2

src="$PWD/$directory/$filename"
dst_dir="$HOME/.$directory"
dst="$dst_dir/$filename"

if [[ ! -d $dst_dir ]]; then
    echo "Creating $dst_dir."
    mkdir -p "$dst_dir"
fi

if [[ ! -e $dst ]]; then
    echo "Copying $src to $dst"
    cp  "$src" "$dst"
else
    echo "$dst already there."
fi
}

function safe_install {
command=$1
echo "Checking $command"
which "$command" &> /dev/null
if [[ $? == 0 ]]; then
    return 0
else
    echo "First install $command."
    return 1
fi
}

append_help "zsh" "Installs oh-my-zsh and link my custom folder."
function install_zsh {
if safe_install 'zsh'; then
    if [[ ! -e "$HOME/.oh-my-zsh" ]]; then
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
  if  safe_install 'nvim' ; then
    link_to_config 'nvim'
    install_nvim_vundle
  fi
}

function install_nvim_vundle {
  VUNDLE_HOME="$HOME/.config/nvim/bundle/Vundle.vim"
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
if  safe_install 'fc-cache' ; then
    IFS=$(printf '\t\n\r')
    font_dir="fonts"
    for font in $font_dir; do
        safe_copy $font_dir $font
    done
    fc-cache "$HOME/.fonts"
fi
}

append_help "git" "Links my gitconfig."
function install_git {
if  safe_install 'git' ; then
    safe_link 'gitconfig'
    safe_link 'git-commit-template.txt'
fi
}

append_help "tmux" "Links tmux.conf"
function install_tmux {
if  safe_install 'tmux' ; then
    safe_link 'tmux.conf'
    if safe_install 'mux' ; then
        echo "Installing tmuxnator"
        gem install tmuxinator
    else
        echo "Tmuxinator already installed"
    fi
fi

}

append_help "rvm" "Install rvm, the ruby version manager"
function install_rvm {
if  safe_install 'rvm' ; then
    RVM_KEYSERVER='hkp://keys.gnupg.net'
    RVM_KEYID='409B6B1796C275462A1703113804BB82D39DC0E3'
    gpg --keyserver $RVM_KEYSERVER \
        --recv-keys $RVM_KEYID
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
    'vim')
        install_vim
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
