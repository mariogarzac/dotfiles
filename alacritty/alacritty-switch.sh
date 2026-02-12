#!/bin/bash

# Path to your dotfiles alacritty config
DOTFILES_DIR="${HOME}/.dotfiles"
ALACRITTY_CONFIG="${DOTFILES_DIR}/alacritty/alacritty.toml"

# Font sizes
STEAMDECK_SIZE=3.0
EXTERNAL_SIZE=13.0

# Detect if we're on the Steam Deck's internal display
# Steam Deck internal display is 800x1280
CURRENT_RESOLUTION=$(xrandr | grep -w connected | grep primary | awk '{print $4}' | cut -d'+' -f1)

# If no primary display, get the first connected display
if [ -z "$CURRENT_RESOLUTION" ]; then
    CURRENT_RESOLUTION=$(xrandr | grep -w connected | head -n1 | awk '{print $3}' | cut -d'+' -f1)
fi

# Check if we're on Steam Deck's internal display (800x1280 or 1280x800)
if [[ "$CURRENT_RESOLUTION" == "800x1280" ]] || [[ "$CURRENT_RESOLUTION" == "1280x800" ]]; then
    echo "Steam Deck internal display detected, setting font size to ${STEAMDECK_SIZE}"
    sed -i "s/^size = .*/size = ${STEAMDECK_SIZE}/" "$ALACRITTY_CONFIG"
else
    echo "External display detected ($CURRENT_RESOLUTION), setting font size to ${EXTERNAL_SIZE}"
    sed -i "s/^size = .*/size = ${EXTERNAL_SIZE}/" "$ALACRITTY_CONFIG"
fi
