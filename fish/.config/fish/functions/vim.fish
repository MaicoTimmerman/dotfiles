function vim
    if command -s nvim > /dev/null
        nvim $argv
    else
        command vim $argv
    end
end

function ovim
    command vim $argv
end
