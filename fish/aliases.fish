#Maico timmerman alias
#User specific aliases and functions

# alias to edit all aliases and automatically load them in
# after editting.
alias editalias="vim /home/maico/dotfiles/fish/aliases.fish; source /home/maico/dotfiles/fish/aliases.fish"
alias editi3="vim /home/maico/.i3/config; i3-msg reload"
alias editfish="vim /home/maico/dotfiles/fish/config.fish; source /home/maico/dotfiles/fish/config.fish"
alias editvim="vim /home/maico/dotfiles/vim/vimrc;"

#cd aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../.."

# More aliases!
alias ls="ls -h --color=auto"
alias cl="clear;ls"
alias xcopy="xclip -selection clipboard"
alias poweroff="sudo poweroff"
alias die="sudo poweroff"
alias reboot="sudo reboot"
alias html="google-chrome"
alias uvavpn='sudo /usr/local/nc/ncsvc -h uvavpn.uva.nl -u 10542590 -r users -f /usr/local/nc/certificaat-uvavpn.der'
alias ccat='pygmentize -g'
alias ip3='ipython3'

alias mountp="mount | column -t"
