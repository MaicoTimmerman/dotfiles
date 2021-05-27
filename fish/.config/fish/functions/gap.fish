function gap --argument directory
    if not test -n "$directory"
        set directory "."
    end
    git add -p $directory
end

