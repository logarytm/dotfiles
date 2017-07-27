#!/usr/bin/env zsh
cd $(dirname $0)
XDG_CONFIG_HOME=${XDG_CONFIG_HOME-$HOME/.config}
error=0
files_to_install=()
force=${force-}

stfu() {
	$* 2>/dev/null
}

group() {
	:
}

install() {
	files_to_install+=("$1:$2")
}

_write_install_manifest() {
	echo $1 >> install_manifest.txt
}

_install() {
	local src=$1
	local dest=$2

	mkdir -p $(dirname $dest)
	if [ -L $dest ]; then
		if [[ x$(stfu realpath $dest) != x$(stfu realpath $src) ]]; then
			if [[ -z $force ]]; then
				echo "warning: not replacing existing symlink $dest" >&2
				error=1
			else
				ln -sfv $(realpath $src) $(realpath $dest)
				_write_install_manifest $dest
			fi
		else
			_write_install_manifest $dest
		fi
	elif [ -f $dest ] || [ -d $dest ]; then
		echo "warning: not replacing existing file $dest" >&2
		error=1
	else
		ln -sv $(realpath $src) $(realpath $dest)
		_write_install_manifest $dest
	fi
}

(echo
 echo 'This script is not foolproof.  It will work a hundred times, the 101st'
 echo 'weeping the blood of virgins and having Russian hackers pwn your system.'
 echo 'Proceed with care.'
 echo) 1>&2

test -f install.log && mv install.log install.log~

for line in $(cat deps); do
	IFS=: read dest url <<< $line
	mkdir -p $(dirname $dest)
	if [ -d $dest ]; then
		# (cd $dest && git pull)
	else
		git clone $url $dest
	fi
done

for line in $(cat index); do
	IFS=: read src dest <<< $line
	dest="$(eval echo $dest)"
	if ! [ -e $src ]; then
		echo "error: source file $src does not exist" >&2
		error=1
	fi
	_install $src $dest
done

if [ $error -ne 0 ]; then
	echo "error: some files were not installed" >&2
fi
exit $error
