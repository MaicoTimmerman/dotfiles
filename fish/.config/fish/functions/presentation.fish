function presentation --description 'Do presentation'
    pdfpc $argv &
    i3-msg workspace "pdfpc-presentation"
    i3-msg move workspace to output left
    i3-msg workspace "pdfpc-presentation"
end
