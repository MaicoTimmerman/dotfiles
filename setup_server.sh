#! /bin/bash

BACKUP_DIR=$PWD/rc_backup

ORIGINAL_BASHRC=$HOME/.bashrc
ORIGINAL_BASHALIASES=$HOME/.bash_aliases
ORIGINAL_DIRCOLORS=$HOME/.dircolors
ORIGINAL_PROFILE=$HOME/.profile
ORIGINAL_GITCONFIG=$HOME/.gitconfig
ORIGINAL_VIMRC=$HOME/.vimrc
ORIGINAL_GNOME_TERMINAL=$HOME/.gconf/apps/gnome-terminal
ORIGINAL_FONTS=$HOME/.fonts

#Move all original rc files to a backup dir.
mkdir -p $BACKUP_DIR
mv \
$ORIGINAL_BASHRC \
$ORIGINAL_BASHALIASES \
$ORIGINAL_DIRCOLORS \
$ORIGINAL_PROFILE \
$ORIGINAL_GITCONFIG \
$ORIGINAL_VIMRC \
$ORIGINAL_GNOME_TERMINAL \
$ORIGINAL_FONTS \
$BACKUP_DIR

# Setup Symlinks for all files
ln -sf $PWD/bash/bashrc $ORIGINAL_BASHRC
ln -sf $PWD/bash/bash_aliases $ORIGINAL_BASHALIASES
ln -sf $PWD/bash/dircolors $ORIGINAL_DIRCOLORS
ln -sf $PWD/bash/profile $ORIGINAL_PROFILE
ln -sf $PWD/git/gitconfig $ORIGINAL_GITCONFIG
ln -sf $PWD/vim/vimrc $ORIGINAL_VIMRC
ln -sf $PWD/gnome-terminal $ORIGINAL_GNOME_TERMINAL
ln -sf $PWD/fonts $ORIGINAL_FONTS

# Setup Vundle for vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo 'Run :BundleInstall inside vim'
sleep 2
vim +BundleInstall
