# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
# set fish_theme agnoster
# set fish_theme ocean
set fish_theme custom_theme

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins git

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

set -g theme display_user yes
set -g default_user maico

# Load oh-my-fish configuration.
source $fish_path/oh-my-fish.fish
source $HOME/dotfiles/fish/aliases.fish

function sudo!!
    commandline -i "sudo $history[1]"
end

function .runsudo --description 'Run current command line as root'
    switch (commandline)
        case 'sudo*'
            commandline -r (echo (commandline) | cut -c 6-)
        case '*'
            set cursor_pos (echo (commandline -C) + 5 | bc)
            commandline -C 0
            commandline -i 'sudo '
            commandline -C "$cursor_pos"
    end
end
bind \cs .runsudo
