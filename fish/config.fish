# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme bobthefish

# Env variables
set TERMINAL urxvtc

# theme settings
set theme_display_user yes
set -g theme_display_ruby no
set -g theme_display_virtualenv no

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins git vundle

# Path to your custom folder (default path is $FISH/custom)
# set fish_custom $HOME/dotfiles/oh-my-fish

set -g theme display_user yes
set -g default_user maico

# Load oh-my-fish configuration.
source $fish_path/oh-my-fish.fish
source $HOME/dotfiles/fish/aliases.fish
