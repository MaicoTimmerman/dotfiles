#!/bin/sh

FILE=/tmp/screen_locked.png
BLURTYPE="0x6"

lock() {
    physlock
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        i3-msg exit
        ;;
    hibernate)
        lock && sudo pm-hibernate
        ;;
    suspend)
        lock && sudo pm-suspend
        ;;
    reboot)
        sudo reboot
        ;;
    poweroff)
        sudo poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|reboot|shutdown}"
        exit 2
esac

exit 0
