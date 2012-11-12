#!/bin/bash
# $1 is song.format

width="900"
height="140"
params="--foreground-color=ffb400aa --background-color=2e4562ff --width=$width --height=$height"

if [[ "$1" == *.wav* ]]
then
  echo "wav"
  ./wav2png $params $1 
else
  echo "other than wav"
  outputfile="$1.png"
  sox $1 -c 1 -r 1600 -t wav - | ./wav2png $params -o $outputfile /dev/stdin
fi
