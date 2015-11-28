#!/bin/sh

FILE=/tmp/screen_locked.png
BLURTYPE="5x7"


lock() {

    scrot $FILE
    convert $FILE -level 0%,100%,0.6 -blur $BLURTYPE  -pointsize 12 -fill white -level -85% -gravity center -annotate +0+100 'This computer is locked!' - | composite -gravity center $HOME/dotfiles/i3/lock.png - $FILE

    # mogrify -scale 5% -scale 2000% $FILE
    i3lock -i $FILE
    rm $FILE
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
