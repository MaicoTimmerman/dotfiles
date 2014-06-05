#! /bin/bash
#
# Script by Maico Timmerman
# Usage:
# rename.sh $1 $2 check the regex expressions $1 and $2.
# rename.sh -x $1 $2 rename all files using the given regex.
case $1 in
    -x)
        shift
        for f in *; do
            newname=`echo "$f" | sed "s/$1/$2/g"`
            if [ -f $newname ];
            then
                echo "Cannot rename $f, $newname already exists"
            else
                mv "$f" "$newname"
            fi
        done
        cmd="ls -h --color=auto"
        eval $cmd
        exit 0
esac

for f in *; do
    newname=`echo "$f" | sed "s/$1/$2/g"`
    if [ -f $newname ];
    then
        echo "Cannot rename $f, $newname already exists"
    else
        echo mv "$f" "$newname"
    fi
done
echo "use '~/rename.sh -x $1 $2' to executed the command"
