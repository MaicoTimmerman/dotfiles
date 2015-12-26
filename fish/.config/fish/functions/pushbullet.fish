function pushbullet --description 'Send to pushbullet'
    set api_key (cat $HOME/dotfiles/private_dotfiles/api_pushbullet)
    set title $argv[1]
    set body $argv[2]
    curl -u $api_key: -d type="note" -d body=$argv[2] -d title=$title \
        'https://api.pushbullet.com/v2/pushes' >/dev/null 2>&1
    echo "Push notification send!"
end
