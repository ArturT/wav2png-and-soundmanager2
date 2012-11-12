#!/bin/bash
# $1 song.format

params="--foreground-color=ffb400aa --background-color=2e4562ff"

if [[ "$1" == *.wav* ]]
then
  echo "wav"
  ./wav2png $params $1 
else
  echo "other than wav"
  outputfile="$1.png"
  sox $1 -c 1 -r 1600 -t wav - | ./wav2png $params -o $outputfile /dev/stdin
fi
