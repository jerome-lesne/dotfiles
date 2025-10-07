#!/bin/bash

# Folder containing wallpapers
WALLPAPER_DIR="$HOME/Pictures/wallpaper"

# Interval in seconds
INTERVAL=300

while true; do
  # Pick a random wallpaper
  WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

  # Preload it once
  hyprctl hyprpaper preload "$WALLPAPER"

  # Apply to all monitors
  for MON in $(hyprctl monitors -j | jq -r '.[].name'); do
    hyprctl hyprpaper wallpaper "$MON,$WALLPAPER"
  done

  sleep "$INTERVAL"
done
