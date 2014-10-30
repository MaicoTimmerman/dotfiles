#Maico timmerman alias
#User specific aliases and functions

# alias to edit all aliases and automatically load them in
# after editting.
alias editalias="vim /home/maico/dotfiles/fish/aliases.fish; source /home/maico/dotfiles/fish/aliases.fish"
alias editi3="vim /home/maico/.i3/config; i3-msg reload"
alias editfish="vim /home/maico/dotfiles/fish/config.fish; source /home/maico/dotfiles/fish/config.fish"

#cd aliases
alias cdics="cd /home/maico/uva/ics"
alias cdac="cd /home/maico/uva/ac"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../.."

# More aliases!
alias ls="ls -h --color=auto"
alias clearl="clear;ls"
alias xclip="xclip -selection clipboard"
alias poweroff="sudo poweroff"
alias die="sudo poweroff"
alias reboot="sudo reboot"
alias html="google-chrome"
alias uvavpn='sudo /usr/local/nc/ncsvc -h uvavpn.uva.nl -u 10542590 -r users -f /usr/local/nc/certificaat-uvavpn.der'
