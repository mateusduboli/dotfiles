#!/bin/bash
# vim:et:sw=4
source setup.cfg
HELP="Commands"
LN_OPTS='-s'
OS=$(uname)

function append_help {
HELP+="\n$1\t\t$2"
}

append_help "usage" "Prints this text."
function show_help {
printf "$HELP\n"
}

function safe_link {
filename=$1
src="$DOT_FILES/$filename"
dst="$HOME/.$filename"
if [[ -e $dst ]] && [[ ! -L $dst ]]; then
    bak="$BACKUP/$filename"
    echo "Saving $dst to $bak"
    mv $dst $bak
fi
if [[ $OS == 'Linux' ]]; then
    if [[ -d $dst ]]; then
        bak="$BACKUP/$filename"
        echo "Saving $dst to $bak"
        mv $dst $bak
    fi
fi
echo "Linking $src to $dst"
ln $LN_OPTS $src $dst
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

function safe_install {
command=$1
echo "Installing $command"
which $command &> /dev/null
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
        curl -L --progress-bar $OH_MY_ZSH_URL | sh
    else
        echo "oh-my-zsh already installed."
    fi
    safe_link 'zshrc'
    safe_link 'zsh'
fi
}

append_help "vim" "Installs vundle, install my plugins and link my vimrc and my vim folder"
function install_vim {
if  safe_install 'vim' ; then
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
fi
}

append_help "fonts" "Copy \'Source Code Pro For Powerline\' to .fonts, and runs fcache"
function install_fonts {
if  safe_install 'fc-cache' ; then
    IFS=$(printf '\t\n\r')
    font_dir="fonts"
    for font in $(ls -1 "$font_dir"); do
        safe_copy $font_dir $font
    done
    fc-cache "$HOME/.fonts"
fi
}

append_help "git" "Links my gitconfig."
function install_git {
if  safe_install 'git' ; then
    safe_link 'gitconfig'
fi
}

append_help "tmux" "Links tmux.conf"
function install_tmux {
if  safe_install 'tmux' ; then
    safe_link 'tmux.conf'
fi
}

append_help "all" "Runs all the above."
function install_all {
echo "Installing all."
install_zsh
install_vim
install_fonts
install_tmux
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
mkdir $BACKUP
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
    'tmux')
        install_tmux
        ;;
    'all')
        install_all
        ;;
    *)
        show_help
        ;;
esac
exit 0
