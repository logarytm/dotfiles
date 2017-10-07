function exch {
  tmp=$(mktemp)
  mv $1 $tmp
  mv $2 $1
  mv $tmp $2
}

function squish {
  mksquashfs $1 ${2-$1.squashfs} -b 1048576 -comp xz -Xdict-size 100%
}
