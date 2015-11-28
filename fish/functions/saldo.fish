function saldo --description 'Get POS saldo'
    echo -n 'POS PIN: '
    stty -echo
    head -n 1 - | read -l pin
    echo
    echo "Saldo: " (curl -s "http://dev.automatis.nl/pos/api/?action=get_user_balance&pin=$pin&user=17")
    stty echo
end
