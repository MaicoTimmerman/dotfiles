# Env variables
set -x TERMINAL urxvtc
set -x EDITOR "urxvtc -e vim"
set FISH_CLIPBOARD_CMD "cat"

# theme settings
set theme_display_user yes

# Display the user@hostname
set -g theme_display_user yes
set -g default_user m

# Do not display the ruby part of the prompt
set -g theme_display_ruby no

# Folder location on the filesystem
set -g sharedvmfolder "$HOME/VirtualBox VMs/Shared Media/mvtovm/"
set -g scrotfolder "$HOME/Pictures/scrot"

# Don't show ugly venv
set VIRTUAL_ENV_DISABLE_PROMPT yes

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
alias xcopy="xclip -selection clipboard"
alias poweroff="sudo poweroff"
alias die="sudo poweroff"
alias reboot="sudo reboot"
alias html="google-chrome"
alias uvavpn='sudo /usr/local/nc/ncsvc -h uvavpn.uva.nl -u 10542590 -r users -f /usr/local/nc/certificaat-uvavpn.der'
alias ccat='pygmentize -g'
alias ip3='ipython3'

alias mountp="mount | column -t"
