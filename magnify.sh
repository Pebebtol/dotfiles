#!/bin/bash

PrintUsage(){
  cat << EOI
Usage: magnify

A simple screen magnifier.

Use the arrow keys to zoom in or out.
Use the mouse cursor to adjust screen section.
Press q to quit.
EOI
}

if ! hash scrot 2>/dev/null && hash feh 2>/dev/null
then
  echo "Could not find scrot and feh"
  exit 1
fi

IMAGE="$(mktemp --tmpdir="/tmp" magnify_XXXXX.png)"
trap 'rm "$IMAGE"' EXIT

scrot "$IMAGE"
#mupdf "$IMAGE"
feh --borderless --image-bg black "$IMAGE"
