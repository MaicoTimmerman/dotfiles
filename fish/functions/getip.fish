function getip --description 'Get external IP address'
    dig +short myip.opendns.com @resolver1.opendns.com
end
