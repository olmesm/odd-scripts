#!/usr/bin/env sh

OUT_DIR=${1:-"tmp"}
FLAG_LIST="
bg
hr
cs
da
nl
en
et
fi
fr
de
el
hu
ga
it
lv
lt
mt
pl
pt
ro
sk
sl
es
sv
"

mkdir -p "$OUT_DIR"

for flag in $FLAG_LIST; do 
  echo ">> Downloading $flag to $OUT_DIR/$flag.png"
  curl --silent "https://countryflagsapi.com/png/$flag" -o "$OUT_DIR/$flag.png"
  echo ">> Downloading $flag to $OUT_DIR/$flag.svg"
  curl --silent "https://countryflagsapi.com/svg/$flag" -o "$OUT_DIR/$flag.svg"
done
