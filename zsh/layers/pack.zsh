# kudos to boohomil
function pack {
  local FILE
  FILE=$1
  case $FILE in
    *.tar)      shift && tar cvf $FILE $* ;;
    *.tar.bz2)  shift && tar cvjf $FILE $* ;;
    *.tbz2)     shift && tar cvjf $FILE $* ;;
    *.tar.gz)   shift && tar cvzf $FILE $* ;;
    *.tgz)      shift && tar cvzf $FILE $* ;;
    *.zip)      shift && zip -r $FILE $*  ;;
    *.rar)      shift && rar $FILE $*     ;;
  esac
}

function unpack {
  while [ "$1" ] ; do
    if ! [ -f "$1" ]; then
      echo "“$1” is not a valid file"
      exit 1
    fi
    case $1 in
      *.tar.bz2)  tar xvjf $1        ;;
      *.tar.gz)   tar xvzf $1        ;;
      *.tar.xz)   tar xvJf $1        ;;
      *.tar.lzma) tar --lzma -xvf $1 ;;
      *.bz2)      bunzip2 $1         ;;
      *.rar)      rar x $1           ;;
      *.gz)       gunzip $1          ;;
      *.tar)      tar xvf $1         ;;
      *.tbz2)     tar xvjf $1        ;;
      *.tgz)      tar xzf $1         ;;
      *.zip)      unzip $1           ;;
      *.Z)        uncompress $1      ;;
      *.7z)       7z x $1            ;;
      *.xz)       unxz $1            ;;
      *.exe)      cabextract $1      ;;
      *.lha)      lha e $1           ;;
      *)          echo "“$1”: unrecognized archive type" || return 1 ;;
    esac
    shift
  done
}
