function lastscrot --description 'Get the filename of the last screenshot'
    ls -Art -d -1 $scrotfolder/* | tail -n 1
end
