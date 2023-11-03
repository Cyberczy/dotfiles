#!/bin/bash

killall -q polybar

polybar bar1 2>&1 | tee -a /tmp/polybar.log & disown
polybar bar2 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
