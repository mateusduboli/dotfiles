#!/bin/zsh
# vim: ft=zsh
function prepend_path {
	export PATH="$1:$PATH"
}

function append_path {
	export PATH="$PATH:$1"
}

function has_git_updates {
for dir in "$HOME/Workspace"/*; do
	LOCAL=$(cd dir && git rev-parse @ 2>/dev/null)
	REMOTE=$(cd dir && git rev-parse @{u} 2>/dev/null)
	BASE=$(cd dir && git merge-base @ @{u} 2>/dev/null)

	echo -ne "$dir: "
	if [ $LOCAL = $REMOTE ]; then
		echo -ne "Up-to-date\n"
	elif [ $LOCAL = $BASE ]; then
		echo -ne "Need to pull\n"
	elif [ $REMOTE = $BASE ]; then
		echo -ne "Need to push\n"
	else
		echo -ne "Diverged\n"
	fi
done
unset dir
}

function gcl_chaordic {
  REPO=$1
  git clone git@github.com:chaordic/$REPO
}

function cd_client() {
  CLIENT=$1
  FOLDER="$HOME/Dev/Clients/$CLIENT"
  if [[ ! -d "$FOLDER" ]]; then
    mkdir -p $FOLDER
  fi
  cd $FOLDER
}

function cd_chaordic() {
  PROJECT=$1
  FOLDER="$HOME/Dev/Chaordic/$PROJECT"
  if [[ ! -d "$FOLDER" ]]; then
    echo "Couldn't find checkouted project: $PROJECT"
    return 1
  else
    cd $FOLDER
  fi
}
