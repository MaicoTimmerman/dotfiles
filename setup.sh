#! /bin/bash

BACKUP_DIR=$PWD/rc_backup

ORIGINAL_BASHRC=$HOME/.bashrc
ORIGINAL_BASHALIASES=$HOME/.bash_aliases
ORIGINAL_DIRCOLORS=$HOME/.dircolors
ORIGINAL_PROFILE=$HOME/.profile
ORIGINAL_GITCONFIG=$HOME/.gitconfig
ORIGINAL_VIMRC=$HOME/.vimrc
PACKAGES=(
    vim git tig htop synapse google-chrome-stable gparted skype audacity powertop zip xclip vlc \
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
$BACKUP_DIR

# Setup Vundle for vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo 'Run :BundleInstall inside vim'
sleep 2
vim

# Setup Symlinks for all files
ln -sf $PWD/bash/bashrc $ORIGINAL_BASHRC
ln -sf $PWD/bash/bash_aliases $ORIGINAL_BASHALIASES
ln -sf $PWD/bash/dircolors $ORIGINAL_DIRCOLORS
ln -sf $PWD/bash/profile $ORIGINAL_PROFILE
ln -sf $PWD/git/gitconfig $ORIGINAL_GITCONFIG
ln -sf $PWD/vim/vimrc $ORIGINAL_VIMRC

# Install the newest updates for already installed packages
sudo apt-get --yes --force-yes upgrade

sudo dpkg --add-architecture i386

# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo sh -c 'echo "deb http://dl.google.com/linux/talkplugin/deb/ stable main" >> /etc/apt/sources.list.d/google-talkplugin.list'

# Skype
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

# Pipeline
sudo apt-add-repository ppa:pipelight/stable

# Dropbox
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo sh -c 'echo "deb http://linux.dropbox.com/ubuntu/ trusty main" >> /etc/apt/sources.list.d/dropbox.list'

# Java
sudo add-apt-repository ppa:webupd8team/java

sudo apt-get update
sudo apt-get --yes --force-yes install ${PACKAGES[@]}

wget -q -O - http://ftp.musicbrainz.org/pub/musicbrainz/picard/picard-1.2.tar.gz | tar zxvf -
sudo python picard-1.2/setup.py install

sudo pipelight-plugin --enable silverlight

echo 'Do you want all LaTeX packages?'
sudo apt-get install \
    texlive-*
