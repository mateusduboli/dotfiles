MATEUSDUBOLI_DOTFILES_HOME=${MATEUSDUBOLI_DOTFILES_HOME}

if [[ -z "$MATEUSDUBOLI_DOTFILES_HOME" ]]; then
  print 'Please define $MATEUSDUBOLI_DOTFILES_HOME to your dotfiles git directory'
  return 1
fi

if [[ ! -d "$MATEUSDUBOLI_DOTFILES_HOME" ]]; then
  print "Directory in \$MATEUSDUBOLI_DOTFILES_HOME doesn't exists: $MATEUSDUBOLI_DOTFILES_HOME"
  return 1
fi

if [[ ! -d "$MATEUSDUBOLI_DOTFILES_HOME/.git" ]]; then
  print "Directory in \$MATEUSDUBOLI_DOTFILES_HOME is not a git repo: $MATEUSDUBOLI_DOTFILES_HOME"
  return 1
fi

if [[ -n $(git --work-tree $MATEUSDUBOLI_DOTFILES_HOME --git-dir $MATEUSDUBOLI_DOTFILES_HOME/.git status --porcelain) ]]; then
  print "There are changes in $MATEUSDUBOLI_DOTFILES_HOME please commit then!"
  return 2
else
  return 0
fi
