#!/bin/bash

PROC=$(pgrep -a "yesplaymusic")
if [ ${#PROC} -eq 0 ]; then
  echo ''
else
  NODE_OPTIONS="--no-deprecation" node ~/.config/polybar/scripts/lyric/app.js
fi
