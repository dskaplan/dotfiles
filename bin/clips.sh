#!/bin/bash

# Break mov into clips based on chapters

while [ $# -gt 0 ]; do

ffmpeg -i "$1" 2> tmp.txt

while read -r first _ _ start _ end; do
  if [[ $first = Chapter ]]; then
    read  # discard line with Metadata:
    read _ _ chapter
    echo $chapter 
    fna="clip_"
    fnc="mp4"
    outp=$fna$chapter$fnc
    ffmpeg -vsync 2 -i "$1" -ss "${start%?}" -to "$end" -an -c:v libx264 -f mp4 "$outp" </dev/null

  fi
done <tmp.txt

rm tmp.txt

shift
done
