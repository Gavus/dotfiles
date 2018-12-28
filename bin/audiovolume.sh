#!/bin/sh

volume_change()
{
    change="$1"
    if test -z "${change}" ; then
        echo "Invalid choice ${change}." \
            "Should be 'up' or 'down'." >&2
        return 1
    fi

    case ${change} in
    [uU][pP])
        #pactl set-sink-volume 0 +5%
        amixer -D pulse sset Master 5%+
        value=$(amixer -D pulse get Master | grep "Front Left:" | awk '{print $5}')
        notify-send -t 800 "Volume set to ${value}"
        ;;

    [dD][oO][wW][nN])
        # pactl set-sink-volume 0 -5%
        amixer -D pulse sset Master 5%-
        value=$(amixer -D pulse get Master | grep "Front Left:" | awk '{print $5}')
        notify-send -t 800 "Volume set to ${value}"
        ;;
    [mM][uU][tT][eE])
        # pactl set-sink-mute 0 toggle
        amixer -D pulse set Master 1+ toggle
        notify-send -t 800 "Volume mute toggled"
        ;;
    esac
}

for change in "$@" ; do
    volume_change "${change}"
done
