#!/usr/bin/env zsh
stfu() {
	$* 2>/dev/null
}

islink() {
	stfu readlink $1
}

error=0
for f in $(cat install.log); do
	if [ -e $f ]; then
		if islink $f || [ x$force != x ]; then
			rm -v $f
		else
			error=1
			echo "warning: not removing $f because it's not a link" 1>&2
		fi
	fi
done

exit $error
