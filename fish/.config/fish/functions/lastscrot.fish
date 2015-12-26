function lastscrot --description 'Get the filename of the last screenshot'
    cd $scrotfolder
    ls -Art -d -1 $PWD/* | tail -n 1
    cd $pwd
end
