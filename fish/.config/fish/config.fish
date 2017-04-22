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
set -g scrotfolder "$HOME/scrot"

# Don't show ugly venv
set VIRTUAL_ENV_DISABLE_PROMPT yes

set PATH /home/maico/.local/bin/ /home/maico/uva/cb/bin /home/maico/.gem/ruby/2.3.0/bin $PATH
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
alias ccat='pygmentize -g -O linenos'
alias ip3='ipython3'
alias td='t display'
alias ti='t in'
alias to='t out'
alias p='ncmpcpp'
alias uvavpn='sudo openconnect --juniper -u 10542590 uvavpn.uva.nl'

alias mountp="mount | column -t"
