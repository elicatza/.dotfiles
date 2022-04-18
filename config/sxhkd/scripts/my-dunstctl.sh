#!/usr/bin/env sh


# Arguments
# reload -> Reloads dunst
# toggle -> Toggles with notifications

if [ -z "$1" ]; then
    printf "Command needs argument!. View sorce code\n"
    exit 1
fi

if [ "$1" = "toggle" ]; then
    if $(dunstctl is-paused); then
        dunstctl set-paused toggle
        notify-send --urgency normal --expire-time 2500 "Dunst" "Enabling notifications" -i "/usr/share/icons/Adwaita/32x32/legacy/preferences-system-notifications-symbolic.symbolic.png"
    else
        notify-send --urgency normal --expire-time 2500 "Dunst" "Disabling notifications" -i "/usr/share/icons/Adwaita/32x32/status/notifications-disabled-symbolic.symbolic.png"
        sleep 2.5
        dunstctl set-paused toggle
    fi
fi

if [ "$1" = "reload" ]; then
    killall dunst
    dunst &
fi
