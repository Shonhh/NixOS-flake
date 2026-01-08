#!/usr/bin/env sh
SCREEN_ROTATION=$(hyprctl monitors | grep -A 20 "eDP-1" | grep 'transform' | awk '{print $NF}')
if [ "$SCREEN_ROTATION" -eq 0 ] ; then
	hyprctl keyword monitor eDP-1,preferred,auto,2,transform,2
    hyprctl keyword input:touchdevice:transform 2
else
    hyprctl keyword monitor eDP-1,preferred,auto,2,transform,0
    hyprctl keyword input:touchdevice:transform 0
fi

# Re-start hyprpaper to force a screen refresh, fixes transparency issues
systemctl --user restart hyprpaper.service
