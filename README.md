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
* gvim
* git
* zsh

##Focus

What I want to accomplish with this repo is:

* Keeping track of my configurations on all my environments;
* Maintain the common and specific configurations from each of then;
* Keep my Home directory uniform;
* Ease the setup on a new environment;
* Download and install github based solutions for configurations problems;
* Provide a per-program based installation;
* Maintain all my configurations only in the home directory.

##Structure

The repository is organized as all the files in the `dotfiles` directory will be
prepended with a `.` and symlinked to the `$HOME` of the current user.

```
  dotfiles/
    |--->vimrc
    |--->gvimrc
    |--->gitconfig
    |--->...
    |--->zsh/
    |     |--->themes\
    |     \--->plugins\
    \--->vim/
```

Local configuration files that shouldn't be present on the repo, will need to be
marked as `.local` so that the scripts on the repo can source then.
