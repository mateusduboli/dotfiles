#configs

My dotfiles and misc stuff to organize the configuration of my unix-like
environments.

##Environments

I currently work in 3 very different environments, which are:

* OSX 10.9 Mavericks
* Fedora 20 (Heisenberg)
* Ubuntu 12.04 LTS

##Configurations
My main goal is to normalize the configuration of the present programns:

* vim
* git
* zsh

##Focus

What I want to accomplish with this repo is:

* Keeping track of my configurations on all my environments;
* Maintain the common configurations from all of then;
* Keep my home directory uniform;
* Ease the setup on a new environment;
* Provide a per-program based installation;
* Keep my configurations user based.

##Structure

#### dotfiles/
On this directory are the files that will be symlinked to home, they will
be prepended with a `.` and symlinked to the `$HOME` of the current user.

```
  dotfiles/
    |--->vimrc
    |--->gvimrc
    |--->gitconfig
    |--->...
    |--->zsh/
    |     |--->themes/
    |     \--->plugins/
    \--->vim/
```

#### configs/
This directory represents the the `$HOME/.config`, commom in some programmams
configuration structure. The files there will be symlinked in the right
subdirectory.

```
  configs/
    |--->terminator/
    |     |--->config
    |--->xfce4/
    |     |--->terminal/
    |     |     |--->terminalrc
    \--->...
```

#### fonts/
This will hold the Source Code Pro for Powerline fonts, so I can copy then to my
`$HOME/.fonts` use the `fc-cache` to install then.

```
  fonts/
    |--->Source Code Pro for Power Line Black.otf
    |--->Source Code Pro for Power Line Regular.otf
    \--->...
```

### Local configurations
Local configuration files that shouldn't be present on the repo, will need to be
marked as `.local` so that the scripts on the repo can source then.

Tests
