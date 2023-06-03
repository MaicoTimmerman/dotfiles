function mkscan --description "Make scan on epson scanner" -a filename
    argparse --min-args=1 'h/help' -- $argv
    or return
    echo "Scanning to $filename.jpg"
    scanimage -d epson2:net:192.168.178.73  --format=jpeg --mode=Gray -o $filename.jpg
    echo "Converting to $filename.pdf"
    convert $filename.jpg $filename.pdf
    rm $filename.jpg
end
