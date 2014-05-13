#!/bin/zsh
function prependToPath {
	export PATH="$1:$PATH"
}

function appendToPath {
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
