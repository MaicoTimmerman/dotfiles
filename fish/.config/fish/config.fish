# Env variables
set -x TERMINAL termite
set -x EDITOR nvim
set -x BROWSER google-chrome
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
set FISH_CLIPBOARD_CMD "cat"

# Do not display the ruby part of the prompt
set -g theme_display_ruby no

# Folder location on the filesystem
set -g sharedvmfolder "$HOME/VirtualBox VMs/Shared Media/mvtovm/"
set -g scrotfolder "$HOME/Pictures/scrot"

# Don't show ugly venv
set VIRTUAL_ENV_DISABLE_PROMPT yes

#cd aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../.."

# More aliases!
alias xcopy="xclip -selection clipboard"
alias html="google-chrome"
alias uvavpn='sudo /usr/local/nc/ncsvc -h uvavpn.uva.nl -u 10542590 -r users -f /usr/local/nc/certificaat-uvavpn.der'
alias ccat='pygmentize -g'
alias ip3='ipython3'
alias td='t display'
alias ti='t in'
alias to='t out'
alias p='ncmpcpp'

alias mountp="mount | column -t"
