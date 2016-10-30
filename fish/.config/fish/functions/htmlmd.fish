function htmlmd --description 'view a md file as html in browser'
    github-markup $argv > /tmp/$argv.html
    google-chrome /tmp/$argv.html
end
