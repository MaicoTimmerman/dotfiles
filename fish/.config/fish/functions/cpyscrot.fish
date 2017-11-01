function cpyscrot --description "Copy lastest screenshot to clipboard as image"
    xclip -selection clipboard -t image/png -i (lastscrot)
end
