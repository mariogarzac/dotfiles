#!/bin/bash
options="🔊 Increase\n🔉 Decrease\n🔇 Mute\n⚙️ Settings"
chosen=$(echo -e "$options" | rofi -dmenu -p "Volume")

case $chosen in
    "🔊 Increase") pactl set-sink-volume @DEFAULT_SINK@ +5% ;;
    "🔉 Decrease") pactl set-sink-volume @DEFAULT_SINK@ -5% ;;
    "🔇 Mute") pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
    "⚙️ Settings") pavucontrol ;;
esac
