#!/usr/bin/env sh

# Terminate already running bar instances
#killall polybar
# If all your bars have ipc enabled, you can also use 
polybar-msg cmd quit

# Launch bar
echo "---" | tee -a /tmp/polybar.log
polybar bar >>/tmp/polybar.log 2>&1 & disown

echo "Bar launched..."
