# Path to your custom oh-my-fish folder (default path is $FISH/custom)
set fish_path /home/maico/dotfiles/oh-my-fish

# Theme
set fish_theme bobthefish

# Env variables
set TERMINAL urxvtc
set FISH_CLIPBOARD_CMD "cat"

# theme settings
set theme_display_user yes
set -g theme_display_ruby no
set -g theme_display_virtualenv no

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins git vundle

set -g theme display_user yes
set -g default_user maico

# Load oh-my-fish configuration.
source $fish_path/oh-my-fish.fish
source $HOME/dotfiles/fish/aliases.fish
