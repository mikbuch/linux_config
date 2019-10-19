# List of bash commands to configure my environment.

############################################
#                Dropbox
############################################
# https://wiki.debian.org/dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd &

# ~/.zshrc should have dropbox alias included


############################################
#          Packages from repos
############################################
apt-get update
apt-get install aptitude
# Texlive latex extra was required for pandoc on debian testing.
aptitude install vim tmux mc doublecmd-gtk zsh git fonts-powerline thunderbird postgresql postgresql-client sudo python3-pip ipython3 gpicview python3-tk curl xclip pandoc livetex texlive-latex-extra tree telnet r-base xfce4-terminal
# vim-gtk is required for clipboard support: https://vim.fandom.com/wiki/Accessing_the_system_clipboard
aptitude install vim-gtk
pip3 install matplotlib scipy pandas numpy


############################################
#          Atom (v1, recommended)
############################################
# https://flight-manual.atom.io/getting-started/sections/installing-atom/
apt install apt-transport-https
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
sudo apt-get update

# Install Atom
sudo apt-get install atom

# Personal Access Token
# it may be get only from my account
# Gist Id
0f49aa5009b46b1e9995a27360d4c94f


############################################
#               Atom (v2)
############################################
# https://tecadmin.net/install-atom-editor-on-ubuntu-debian-and-linuxmint/
init_dir=$(pwd)
cd /tmp
wget https://atom.io/download/deb -O atom.deb
dpkg -i atom.deb
aptitude install -f
dpkg -i atom.deb
cd $init_dir

# Gradle has to be installed by hand as well (repositories hold older version).


############################################
#          LightDM unhide users
############################################
# https://wiki.debian.org/LightDM
# [Seat:*]
# greeter-hide-users=false
vim /usr/share/lightdm/lightdm.conf.d/01_*.conf


############################################
#               sudoers
############################################
# https://askubuntu.com/a/7484
# You cannot skip "sudo", even as root.
sudo adduser <username> sudo

# The change will take effect the next time the user logs in.
# This works because /etc/sudoers is pre-configured to grant permissions to all members of this group (You should not have to make any changes to this):
# # Allow members of group sudo to execute any command
# %sudo   ALL=(ALL:ALL) ALL


############################################
#             Sources list
############################################
# https://wiki.debian.org/SourcesList#Distribution


############################################
#                Terminal
############################################
# As of 30th of April 2019 I switched to termite on Debian Stable, because
# of rendering breaking in mc on xterm4-terminal.

# Install termite
https://gist.github.com/crivotz/d4e43ebce09621906571f3720e676781
https://gist.githubusercontent.com/crivotz/d4e43ebce09621906571f3720e676781/raw/612f803f647ef863f71bda3fcdd7240a8c2ca470/Termite%2520on%2520Debian

# Shortcut in xfce
termite -e tmux
# xfce4-terminal -e tmux

# On Archlinux, on September 1, 2019, I decided to use xfce4-terminal, even though
# I'm still using i3 window manager. The reason for that is that zooming font in
# and out works on this. In order to enable UTF-8 support there, use:
# Preferences -> Advanced -> Character encoding


############################################
#               DPI (HiRes)
############################################
# TODO


############################################
#                  Zsh
############################################
# My post: http://mikbuch.github.io/articles/2019/02/16/Zsh-Antigen.html
# Antigen https://github.com/zsh-users/antigen
curl -L git.io/antigen > ~/antigen.zsh

# zshrc gist
# https://gist.github.com/mikbuch/de96c3a65908f87288c102a0931fd43c
wget https://gist.github.com/mikbuch/de96c3a65908f87288c102a0931fd43c -o ~/.zshrc

# For root you have to:
echo "source /home/cereberus/antigen.zsh" > ~/antigen.zsh
echo "source /home/cereberus/.zshrc" > /root/.zshrc

# Optionally you may use good ol' oh-my-zsh
# Do this after re-login (user has to be in sudoers).
# https://github.com/robbyrussell/oh-my-zsh#basic-installation
# sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# As root:
# echo "source /home/pcss/.zshrc" > /root/.zshrc

# Supplementary command (for root).
chsh -s $(which zsh)


############################################
#                  vim
############################################
# Set vim copy to clipboard
#TODO

# vimrc config: https://github.com/amix/vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
echo "set nu" >> ~/.vimrc


############################################
#                  Skype
############################################
# Now you can use web interface.
# https://web.skype.com/en/

# Install Skype: https://wiki.debian.org/skype#A64_bits.2Famd64
# You have to use web browser's interface:
# https://go.skype.com/skypeforlinux-64.deb

# Or download with:
wget https://repo.skype.com/latest/skypeforlinux-64.deb
dpkg -i skype*.deb

# Using gdebi (source unknown).
aptitude install gdebi
gdebi skypeforlinux*

# Remember about the skype alias with altered latency (included in zshrc).
alias skype='env PULSE_LATENCY_MSEC=30 skypeforlinux'


############################################
#                  Time
############################################
# Timezone
/usr/sbin/dpkg-reconfigure tzdata
# Clock format, XFCE panel item (https://www.cyberciti.biz/faq/linux-unix-formatting-dates-for-display/)
%a, %m-%d, %l:%M %p


############################################
#        Set Python3 as default
############################################
# Source: https://linuxconfig.org/how-to-change-from-default-to-alternative-python-version-on-debian-linux
# List available alternatives:
update-alternatives --list python
update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
update-alternatives --install /usr/bin/python python /usr/bin/python3.5 2

# To install newer python version:
# Go to: https://www.python.org/downloads/
# Then follow the instructions from here (note, you need appropriate zlib to `make install`,
# https://unix.stackexchange.com/a/334103):
# sudo apt-get install zlib1g-dev
# https://dzone.com/articles/install-python-370-on-ubuntu-1804debian-95

# In this order, 3.5 should be default, else use the command below:
update-alternatives --config python


############################################
#                 PIP
############################################
# Get pip 2.7 (https://stackoverflow.com/a/26267333/8877692):
cd /tmp
wget https://bootstrap.pypa.io/get-pip.py
sudo python2.7 get-pip.py

# Install pip alternatives
sudo update-alternatives --install /usr/local/bin/pip pip  /usr/local/bin/pip2.7 1
sudo update-alternatives --install /usr/local/bin/pip pip  /usr/local/bin/pip3.7 2
# Validate installation
sudo update-alternatives --list pip
# To later on alternate the default pip
sudo update-alternatives --config pip


############################################
#                TMUX
############################################
# Recent version:
# https://github.com/gpakosz/.tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
tmux source-file ~/.tmux.conf

# Alternative version:
echo "# Enable scrolling with mouse scroll." >> ~/.tmux.conf
echo "set-option -g mouse on" >> ~/.tmux.conf
echo "" >> ~/.tmux.conf
echo "# Theme pack." >> ~/.tmux.conf
echo "source-file "${HOME}/.tmux-themepack/powerline/block/green.tmuxtheme"" >> ~/.tmux.conf


############################################
#               VirtualBox
############################################
# Install VirtualBox
# https://wiki.debian.org/VirtualBox.
echo "deb http://download.virtualbox.org/virtualbox/debian stretch contrib" > /etc/apt/sources.list.d/virtualbox.list
wget https://www.virtualbox.org/download/oracle_vbox_2016.asc

sudo apt-key add oracle_vbox_2016.asc

sudo apt-get update
sudo apt-get install virtualbox-5.2

# Download and install guest additions.


############################################
#               Workbench
############################################
# https://stackoverflow.com/questions/48306849/lib-x86-64-linux-gnu-libz-so-1-version-zlib-1-2-9-not-found


############################################
#           Default keyring
############################################
# Unlock keyring
# I am not sure if that works:
# https://unix.stackexchange.com/a/324844
rm ~/.local/share/keyrings/*


############################################
#        Tree monitors at startup
############################################
# ? ~/.Xsession


############################################
#         Add PL keyboard layout
############################################
#TODO


############################################
#                Jupyter
############################################
# In order to use %matplotlib notebook or ipympl backends you have to install:
# 1. Nodejs (at least v. 6.11):
#    https://linuxize.com/post/how-to-install-node-js-on-debian-9/
curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
sudo apt install nodejs
# 2. npm (https://tecadmin.net/install-latest-nodejs-npm-on-debian/):
sudo apt-get install curl software-properties-common
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
sudo apt-get install nodejs
# 3. Jupyter labextensions:
#    https://github.com/jupyter-widgets/ipywidgets/issues/2105#issuecomment-458340278
jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter labextension install jupyter-matplotlib


############################################
#            Evince (not tested)
############################################
# Set evince as default PDF viewer
# Source: https://askubuntu.com/a/708401 after https://unix.stackexchange.com/a/239984/258734
echo "image/pdf=evince.desktop" > ~/.config/mimeapps.list
# or do it manually:
# vim ~/.config/mimeapps.list

# or set "default program" in file viewer


############################################
#                  WiFi
############################################
# General information on installation on Lenovo Thinkpad T440p (WiFi section)
# https://wiki.debian.org/InstallingDebianOn/Thinkpad/T440p/jessie#WiFi

# Get *.deb package for offline installation (in case you don't have Ethernet connection.
# https://packages.debian.org/stretch/firmware-iwlwifi
# https://wiki.debian.org/iwlwifi

su

# If you have firmware-*.deb package install it with.
dpkg -i /media/pcss/DEBIAN*/firmware-*_all.deb

# Load the module.
modprobe -r iwlwifi ; modprobe iwlwifi


############################################
#            Android studio
############################################
# Create entry in /usr/local/bin
sudo echo "bash /opt/android-studio/bin/studio.sh" >> /usr/local/bin/android-studio
sudo chmod +x /usr/local/bin/android-studio
