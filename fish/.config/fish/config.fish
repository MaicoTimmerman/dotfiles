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

#cd aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../.."

# More aliases!
alias xcopy="xclip -selection clipboard"
alias html="google-chrome"
alias ccat='pygmentize -g -O linenos'
alias ip3='ipython3'
alias uvavpn='sudo openconnect --juniper -u 10542590 uvavpn.uva.nl'

alias mountp="mount | column -t"
alias k="kubectl"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/maico/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/home/maico/google-cloud-sdk/path.fish.inc'; else; . '/home/maico/google-cloud-sdk/path.fish.inc'; end; end

bind \e\[1\;5C forward-word
bind \e\[1\;5D backward-word
