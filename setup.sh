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
PACKAGES=(
    vim git tig tree htop synapse google-chrome-stable gparted skype audacity powertop zip xclip vlc \
    valgrind unrar unzip ipython python3 qalculate openssh-server newsbeuter keepass2 imagemagick \
    lxappearance compizconfig-settings-manager pipelight-multi dropbox oracle-java8-installer \
    google-talkplugin shutter cheese
)

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
$BACKUP_DIR

# Backup the gconftool2 settings
gconftool-2 --dump "/apps/gnome-terminal" > $BACKUP_DIR/gconftool_gnome-terminal.xml

# Setup the terminal settings
gconftool-2 --load $PWD/gnome-terminal/gnome-terminal.xml

# Setup Symlinks for all files
ln -sf $PWD/bash/bashrc $ORIGINAL_BASHRC
ln -sf $PWD/bash/bash_aliases $ORIGINAL_BASHALIASES
ln -sf $PWD/bash/dircolors $ORIGINAL_DIRCOLORS
ln -sf $PWD/bash/profile $ORIGINAL_PROFILE
ln -sf $PWD/git/gitconfig $ORIGINAL_GITCONFIG
ln -sf $PWD/vim/vimrc $ORIGINAL_VIMRC
ln -sf $PWD/gnome-terminal $ORIGINAL_GNOME_TERMINAL
ln -sf $PWD/fonts $ORIGINAL_FONTS

# Install the newest updates for already installed packages
sudo apt-get --yes --force-yes upgrade

sudo dpkg --add-architecture i386

# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
if [[ ! -e "/etc/apt/sources.list.d/google-chrome.list" ]];
then
    sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
fi

if [[ ! -e "/etc/apt/sources.list.d/google-talkplugin.list" ]];
then
    sudo sh -c 'echo "deb http://dl.google.com/linux/talkplugin/deb/ stable main" >> /etc/apt/sources.list.d/google-talkplugin.list'
fi

# Skype
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

# Java
sudo add-apt-repository ppa:webupd8team/java

# Pipeline
sudo apt-add-repository ppa:pipelight/stable

# Dropbox
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
if [[ ! -e "/etc/apt/sources.list.d/dropbox.list" ]];
then
    sudo sh -c 'echo "deb http://linux.dropbox.com/ubuntu/ trusty main" >> /etc/apt/sources.list.d/dropbox.list'
fi

sudo apt-get update

for item in ${PACKAGES[*]}
do
    sudo apt-get --yes --force-yes install $ITEM
done

sudo pipelight-plugin --enable silverlight

# Setup Vundle for vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo 'Run :BundleInstall inside vim'
sleep 2
vim

echo 'Do you want all LaTeX packages?'
sudo apt-get install \
    texlive-*
