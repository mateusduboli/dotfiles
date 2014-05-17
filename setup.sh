#!/bin/bash
# vim:et:sw=4
source setup.cfg
HELP="Commands"

function append_help {
HELP+="\n$1\t\t$2"
}

append_help "usage" "Prints this text."
function show_help {
printf "$HELP\n"
}

function safe_link {
filename=$1
src="$PWD/dotfiles/$filename"
dst="$HOME/.$filename"
if [[ -e $dst ]] && [[ ! -L $dst ]]; then
    bak="$BACKUP/$filename"
    echo "Saving $dst to $bak ."
    mv $dst $bak
fi
echo "Linking $src to $dst"
ln -shi $src $dst
}

function safe_copy {
directory=$1
filename=$2

src="$PWD/$directory/$filename"
dst_dir="$HOME/.$directory"
dst="$dst_dir/$filename"

if [[ ! -d $dst_dir ]]; then
    echo "Creating $dst_dir."
    mkdir -p $dst_dir
fi

if [[ ! -e $dst ]]; then
    echo "Copying $src to $dst"
    cp $src $dst
else
    echo "$dst already there."
fi
}

append_help "zsh" "Installs oh-my-zsh and link my custom folder."
function install_zsh {
echo "Installing oh-my-zsh."
which 'zsh' &> /dev/null # Checks for ZSH
if [[ $? == 0 ]]; then
    if [[ ! -e "$HOME/.oh-my-zsh" ]]; then
        curl -L --progress-bar http://install.ohmyz.sh | sh
    else
        echo "oh-my-zsh already installed."
    fi
    safe_link 'zshrc'
    safe_link 'zsh'
else
    echo "First install zsh."
fi
}

append_help "vim" "Installs vundle, install my plugins and link my vimrc and my vim folder"
function install_vim {
echo "Installing vundle."
which 'vim' &> /dev/null # Checks for vim
if [[ $? == 0 ]]; then
    VUNDLE_HOME=$HOME/.vim/bundle/vundle
    if [[ -e "$VUNDLE_HOME" ]]; then
        git clone $VUNDLE_URL $VUNDLE_HOME &>/dev/null
    else
        echo "Vundle already installed."
    fi
    vim +PluginInstall +qa
    safe_link 'vrapperrc'
    safe_link 'gvimrc'
    safe_link 'vimrc'
    safe_link 'vim'
else
    echo "First install vim."
fi
}

append_help "fonts" "Copy \'Source Code Pro For Powerline\' to .fonts, and runs fcache"
function install_fonts {
echo "Installing fonts."
which 'fc-cache' &> /dev/null
if [[ $? == 0 ]]; then
    IFS=$(printf '\t\n\r')
    font_dir="fonts"
    for font in $(ls -1 "$font_dir"); do
        safe_copy $font_dir $font
    done
    fc-cache "$HOME/.fonts"
else
    echo "First install fcache."
fi
}

append_help "git" "Links my gitconfig."
function install_git {
echo "Installing git"
safe_link 'gitconfig'
}

append_help "all" "Runs all the above."
function install_all {
echo "Installing all."
install_zsh
install_vim
install_fonts
install_git
}

case "$1" in
    'zsh')
        install_zsh
        ;;
    'vim')
        install_vim
        ;;
    'fonts')
        install_fonts
        ;;
    'git')
        install_git
        ;;
    'all')
        install_all
        ;;
    *)
        show_help
        ;;
esac
exit 0
