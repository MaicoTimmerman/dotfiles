#!/bin/sh

lock() {
    scrot /tmp/screen_locked.png
    mogrify -scale 5% -scale 2000% /tmp/screen_locked.png
    i3lock -i /tmp/screen_locked.png
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
