#!/bin/bash

function .ble-bind.function-key.CSI-CMS {
  local Fp="$1" Ft="$2" key="$3"
  ble-bind -k "ESC [ $Fp $Ft"     "$key"
  ble-bind -k "ESC [ $Fp ; 1 $Ft" "$key"
  ble-bind -k "ESC [ $Fp ; 2 $Ft" "S-$key"
  ble-bind -k "ESC [ $Fp ; 3 $Ft" "M-$key"
  ble-bind -k "ESC [ $Fp ; 4 $Ft" "M-S-$key"
  ble-bind -k "ESC [ $Fp ; 5 $Ft" "C-$key"
  ble-bind -k "ESC [ $Fp ; 6 $Ft" "C-S-$key"
  ble-bind -k "ESC [ $Fp ; 7 $Ft" "C-M-$key"
  ble-bind -k "ESC [ $Fp ; 8 $Ft" "C-M-S-$key"
}
function .ble-bind.function-key.SS3-CMS {
  local Ft="$1" key="$2"
  ble-bind -k "ESC O $Ft"   "$key"
  ble-bind -k "ESC O 1 $Ft" "$key"
  ble-bind -k "ESC O 2 $Ft" "S-$key"
  ble-bind -k "ESC O 3 $Ft" "M-$key"
  ble-bind -k "ESC O 4 $Ft" "M-S-$key"
  ble-bind -k "ESC O 5 $Ft" "C-$key"
  ble-bind -k "ESC O 6 $Ft" "C-S-$key"
  ble-bind -k "ESC O 7 $Ft" "C-M-$key"
  ble-bind -k "ESC O 8 $Ft" "C-M-S-$key"
}

function .ble-bind.function-key.SS3/CSI {
  local Ft="$1" name="$2"
  ble-bind -k "ESC [ $Ft" "$name"
  .ble-bind.function-key.CSI-CMS '1' "$Ft" "$name"
  .ble-bind.function-key.SS3-CMS "$Ft" "$name"
}

function .ble-bind.function-key.CSI-FtCS {
  local Fp="$1" key="$2"
  ble-bind -k "ESC [ $Fp \$" "S-$key"
  ble-bind -k "ESC [ $Fp ^" "C-$key"
  ble-bind -k "ESC [ $Fp @" "C-S-$key"
}


function ble-bind-function-key+default {
  # paste = S-insert [rxvt]
  # scroll_up = S-prior [rxvt]
  # scroll_down = S-next [rxvt]
  # help = f15 [rxvt]
  # menu = f16 [rxvt]
  # print = f16 [xterm]
  # deleteline = A-delete

  echo -n "cmap/default.sh: registering SS3 sequences... " 1>&2
  # vt100, xterm, application mode
  .ble-bind.function-key.SS3/CSI 'A' up
  .ble-bind.function-key.SS3/CSI 'B' down
  .ble-bind.function-key.SS3/CSI 'C' right
  .ble-bind.function-key.SS3/CSI 'D' left
  .ble-bind.function-key.SS3/CSI 'E' begin
  .ble-bind.function-key.SS3/CSI 'F' end
  .ble-bind.function-key.SS3/CSI 'H' home
  .ble-bind.function-key.SS3/CSI 'M' kpent
  .ble-bind.function-key.SS3/CSI 'P' f1
  .ble-bind.function-key.SS3/CSI 'Q' f2
  .ble-bind.function-key.SS3/CSI 'R' f3
  .ble-bind.function-key.SS3/CSI 'S' f4
  #.ble-bind.function-key.SS3/CSI 'Z' S-tab
  .ble-bind.function-key.SS3/CSI 'j' kpmul # *
  .ble-bind.function-key.SS3/CSI 'k' kpadd # +
  .ble-bind.function-key.SS3/CSI 'l' kpsep # ,
  .ble-bind.function-key.SS3/CSI 'm' kpsub # -
  .ble-bind.function-key.SS3/CSI 'n' kpdec # .
  .ble-bind.function-key.SS3/CSI 'o' kpdiv # /
  .ble-bind.function-key.SS3/CSI 'p' kp0
  .ble-bind.function-key.SS3/CSI 'q' kp1
  .ble-bind.function-key.SS3/CSI 'r' kp2
  .ble-bind.function-key.SS3/CSI 's' kp3
  .ble-bind.function-key.SS3/CSI 't' kp4
  .ble-bind.function-key.SS3/CSI 'u' kp5
  .ble-bind.function-key.SS3/CSI 'v' kp6
  .ble-bind.function-key.SS3/CSI 'w' kp7
  .ble-bind.function-key.SS3/CSI 'x' kp8
  .ble-bind.function-key.SS3/CSI 'y' kp9
  echo "done" 1>&2

  echo -n "cmap/default.sh: registering CSI function-key sequences... " 1>&2
  # # vt52, xterm, rxvt
  # .ble-bind.function-key.CSI-CMS '1' '~' find
  # .ble-bind.function-key.CSI-CMS '2' '~' insert
  # .ble-bind.function-key.CSI-CMS '3' '~' delete # execute
  # .ble-bind.function-key.CSI-CMS '4' '~' select
  # .ble-bind.function-key.CSI-CMS '5' '~' prior
  # .ble-bind.function-key.CSI-CMS '6' '~' next
  # .ble-bind.function-key.CSI-CMS '7' '~' home
  # .ble-bind.function-key.CSI-CMS '8' '~' end

  # # vt100
  # .ble-bind.function-key.CSI-CMS '1' '~' insert
  # .ble-bind.function-key.CSI-CMS '2' '~' home
  # .ble-bind.function-key.CSI-CMS '3' '~' prior
  # .ble-bind.function-key.CSI-CMS '4' '~' delete
  # .ble-bind.function-key.CSI-CMS '5' '~' end
  # .ble-bind.function-key.CSI-CMS '6' '~' next

  # # cygwin, screen, rosaterm
  # .ble-bind.function-key.CSI-CMS '1' '~' home
  # .ble-bind.function-key.CSI-CMS '2' '~' insert
  # .ble-bind.function-key.CSI-CMS '3' '~' delete
  # .ble-bind.function-key.CSI-CMS '4' '~' end
  # .ble-bind.function-key.CSI-CMS '5' '~' prior
  # .ble-bind.function-key.CSI-CMS '6' '~' next

  if [[ $(tput kend) == "[5~" ]]; then
    .ble-bind.function-key.CSI-CMS '1' '~' insert
    .ble-bind.function-key.CSI-CMS '2' '~' home
    .ble-bind.function-key.CSI-CMS '3' '~' prior
    .ble-bind.function-key.CSI-CMS '4' '~' delete
    .ble-bind.function-key.CSI-CMS '5' '~' end
    .ble-bind.function-key.CSI-CMS '6' '~' next
  else
    .ble-bind.function-key.CSI-CMS '1' '~' home
    .ble-bind.function-key.CSI-CMS '2' '~' insert
    .ble-bind.function-key.CSI-CMS '3' '~' delete
    .ble-bind.function-key.CSI-CMS '4' '~' end
    .ble-bind.function-key.CSI-CMS '5' '~' prior
    .ble-bind.function-key.CSI-CMS '6' '~' next
  fi
  .ble-bind.function-key.CSI-CMS '7' '~' home
  .ble-bind.function-key.CSI-CMS '8' '~' end

  # vt220, xterm, rxvt
  .ble-bind.function-key.CSI-CMS '1 1' '~' f1
  .ble-bind.function-key.CSI-CMS '1 2' '~' f2
  .ble-bind.function-key.CSI-CMS '1 3' '~' f3
  .ble-bind.function-key.CSI-CMS '1 4' '~' f4
  .ble-bind.function-key.CSI-CMS '1 5' '~' f5
  .ble-bind.function-key.CSI-CMS '1 7' '~' f6
  .ble-bind.function-key.CSI-CMS '1 8' '~' f7
  .ble-bind.function-key.CSI-CMS '1 9' '~' f8
  .ble-bind.function-key.CSI-CMS '2 0' '~' f9
  .ble-bind.function-key.CSI-CMS '2 1' '~' f10
  .ble-bind.function-key.CSI-CMS '2 3' '~' f11
  .ble-bind.function-key.CSI-CMS '2 4' '~' f12
  .ble-bind.function-key.CSI-CMS '2 5' '~' f13
  .ble-bind.function-key.CSI-CMS '2 6' '~' f14
  .ble-bind.function-key.CSI-CMS '2 8' '~' f15
  .ble-bind.function-key.CSI-CMS '2 9' '~' f16
  .ble-bind.function-key.CSI-CMS '3 1' '~' f17
  .ble-bind.function-key.CSI-CMS '3 2' '~' f18
  .ble-bind.function-key.CSI-CMS '3 3' '~' f19
  .ble-bind.function-key.CSI-CMS '3 4' '~' f20
  echo "done" 1>&2

  echo -n "cmap/default.sh: registering rxvt CSI modified-function-key sequences... " 1>&2
  # rxvt: 'CSI Fp $' 'CSI Fp ^' 'CSI Fp @'
  .ble-bind.function-key.CSI-FtCS   '1' insert
  .ble-bind.function-key.CSI-FtCS   '2' home
  .ble-bind.function-key.CSI-FtCS   '3' prior
  .ble-bind.function-key.CSI-FtCS   '4' delete
  .ble-bind.function-key.CSI-FtCS   '5' end
  .ble-bind.function-key.CSI-FtCS   '6' next
  .ble-bind.function-key.CSI-FtCS   '7' home
  .ble-bind.function-key.CSI-FtCS   '8' end
  .ble-bind.function-key.CSI-FtCS '1 1' f1
  .ble-bind.function-key.CSI-FtCS '1 2' f2
  .ble-bind.function-key.CSI-FtCS '1 3' f3
  .ble-bind.function-key.CSI-FtCS '1 4' f4
  .ble-bind.function-key.CSI-FtCS '1 5' f5
  .ble-bind.function-key.CSI-FtCS '1 7' f6
  .ble-bind.function-key.CSI-FtCS '1 8' f7
  .ble-bind.function-key.CSI-FtCS '1 9' f8
  .ble-bind.function-key.CSI-FtCS '2 0' f9
  .ble-bind.function-key.CSI-FtCS '2 1' f10
  .ble-bind.function-key.CSI-FtCS '2 3' f11
  .ble-bind.function-key.CSI-FtCS '2 4' f12
  .ble-bind.function-key.CSI-FtCS '2 5' f13
  .ble-bind.function-key.CSI-FtCS '2 6' f14
  .ble-bind.function-key.CSI-FtCS '2 8' f15
  .ble-bind.function-key.CSI-FtCS '2 9' f16
  .ble-bind.function-key.CSI-FtCS '3 1' f17
  .ble-bind.function-key.CSI-FtCS '3 2' f18
  .ble-bind.function-key.CSI-FtCS '3 3' f19
  .ble-bind.function-key.CSI-FtCS '3 4' f20
  echo "done" 1>&2

  echo -n "cmap/default.sh: registering xterm CSI 27 sequences... " 1>&2
  # xterm, rosaterm
  .ble-bind.function-key.CSI-CMS '2 7'     '; 8 ~' BS
  .ble-bind.function-key.CSI-CMS '2 7'     '; 9 ~' TAB
  .ble-bind.function-key.CSI-CMS '2 7'   '; 1 3 ~' RET
  .ble-bind.function-key.CSI-CMS '2 7'   '; 2 7 ~' ESC

  .ble-bind.function-key.CSI-CMS '2 7'   '; 3 2 ~' SP
  .ble-bind.function-key.CSI-CMS '2 7'   '; 3 3 ~' '!'
  .ble-bind.function-key.CSI-CMS '2 7'   '; 3 4 ~' '"'
  .ble-bind.function-key.CSI-CMS '2 7'   '; 3 5 ~' '#'
  .ble-bind.function-key.CSI-CMS '2 7'   '; 3 6 ~' '$'
  .ble-bind.function-key.CSI-CMS '2 7'   '; 3 7 ~' '%'
  .ble-bind.function-key.CSI-CMS '2 7'   '; 3 8 ~' '&'
  .ble-bind.function-key.CSI-CMS '2 7'   '; 3 9 ~' "'"
  .ble-bind.function-key.CSI-CMS '2 7'   '; 4 0 ~' '('
  .ble-bind.function-key.CSI-CMS '2 7'   '; 4 1 ~' ')'
  .ble-bind.function-key.CSI-CMS '2 7'   '; 4 2 ~' '*'
  .ble-bind.function-key.CSI-CMS '2 7'   '; 4 3 ~' '+'
  .ble-bind.function-key.CSI-CMS '2 7'   '; 4 4 ~' ','
  .ble-bind.function-key.CSI-CMS '2 7'   '; 4 5 ~' '-'
  .ble-bind.function-key.CSI-CMS '2 7'   '; 4 6 ~' ','
  .ble-bind.function-key.CSI-CMS '2 7'   '; 4 7 ^' '/'

  .ble-bind.function-key.CSI-CMS '2 7'   '; 4 8 ~' 0
  .ble-bind.function-key.CSI-CMS '2 7'   '; 4 9 ~' 1
  .ble-bind.function-key.CSI-CMS '2 7'   '; 5 0 ~' 2
  .ble-bind.function-key.CSI-CMS '2 7'   '; 5 1 ~' 3
  .ble-bind.function-key.CSI-CMS '2 7'   '; 5 2 ~' 4
  .ble-bind.function-key.CSI-CMS '2 7'   '; 5 3 ~' 5
  .ble-bind.function-key.CSI-CMS '2 7'   '; 5 4 ~' 6
  .ble-bind.function-key.CSI-CMS '2 7'   '; 5 5 ~' 7
  .ble-bind.function-key.CSI-CMS '2 7'   '; 5 6 ~' 8
  .ble-bind.function-key.CSI-CMS '2 7'   '; 5 7 ~' 9
  .ble-bind.function-key.CSI-CMS '2 7'   '; 5 8 ~' ':'
  .ble-bind.function-key.CSI-CMS '2 7'   '; 5 9 ~' ';'
  .ble-bind.function-key.CSI-CMS '2 7'   '; 6 0 ~' '<' 
  .ble-bind.function-key.CSI-CMS '2 7'   '; 6 1 ~' '='
  .ble-bind.function-key.CSI-CMS '2 7'   '; 6 2 ~' '>'
  .ble-bind.function-key.CSI-CMS '2 7'   '; 6 3 ~' '?'

  .ble-bind.function-key.CSI-CMS '2 7'   '; 9 2 ~' '\'

  .ble-bind.function-key.CSI-CMS '2 7'   '; 9 6 ~' '`'
  .ble-bind.function-key.CSI-CMS '2 7'   '; 9 7 ~' a
  .ble-bind.function-key.CSI-CMS '2 7'   '; 9 8 ~' b
  .ble-bind.function-key.CSI-CMS '2 7'   '; 9 9 ~' c
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 0 0 ~' d
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 0 1 ~' e
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 0 2 ~' f
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 0 3 ~' g
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 0 4 ~' h
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 0 5 ~' i
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 0 6 ~' j
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 0 7 ~' k
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 0 8 ~' l
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 0 9 ~' m
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 1 0 ~' n
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 1 1 ~' o
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 1 2 ~' p
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 1 3 ~' q
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 1 4 ~' r
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 1 5 ~' s
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 1 6 ~' t
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 1 7 ~' u
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 1 8 ~' v
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 1 9 ~' w
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 2 0 ~' x
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 2 1 ~' y
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 2 2 ~' z
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 2 3 ~' '{'
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 2 4 ~' '|'
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 2 5 ~' '}'
  .ble-bind.function-key.CSI-CMS '2 7' '; 1 2 6 ~' '~'
  echo "done" 1>&2

  echo -n "cmap/default.sh: registering cygwin f1-f4... " 1>&2
  # cygwin specific
  ble-bind -k 'ESC [ [ A' f1
  ble-bind -k 'ESC [ [ B' f2
  ble-bind -k 'ESC [ [ C' f3
  ble-bind -k 'ESC [ [ D' f4
  echo "done" 1>&2
}

ble-bind-function-key+default