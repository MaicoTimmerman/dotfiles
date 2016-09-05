function htmlmd --description 'view a md file as html in browser'
    pandoc $argv -o /tmp/$argv.html
    google-chrome /tmp/$argv.html
end
