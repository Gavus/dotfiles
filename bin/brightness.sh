#!/bin/sh

brightness_get()
{
    echo "text"
}

brightness_change()
{
    change="$1"
    if test -z "${change}" ; then
        echo "Invalid choice"
        "Should be 'up' or 'down'." >&2
        return 1
    fi

    case ${change} in
        [uU][pP])
	    xbacklight -inc 10
            ;;

        [dD][oO][wW][nN])
	    xbacklight -dec 10
            ;;
    esac
}

for change in "$@" ; do
    brightness_change "${change}"
    value=$(xbacklight -get)
    notify-send -t 800 "Screen brightness set to ${value}"
done
