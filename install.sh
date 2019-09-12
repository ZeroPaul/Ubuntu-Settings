#!/bin/bash


echo "Updating"
#sudo apt-get update

#echo "Install OpenSSH"
# sudo apt-get install -y openssh-server

echo "Install Git"
#sudo apt-get install -y git git-core
# read -p 'User Name :: ' userx
# read -p 'User Email :: ' emailx

# Confirmation
#while true; do 
#    echo "\n"
#    read -p "Do you wish to this Settings? (Yes/No) :: " yn
#    case $yn in
#        [Yy]* )
#            echo Make Settings
#            git config --global user.name "$userx"
#            git config --global user.email "$emailx"
#            #ssh-keygen
#            cat ~/.ssh/id_rsa.pub;
#            break;;
#        [Nn]* ) 
#            echo Cancel;
#            exit;;
#        * ) echo "Please answer yes or no.";;
#    esac
#done

echo "Install Guake"
# sudo apt-get install -y guake

echo "Install Chrome"
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb --no-check-certificate
#sudo dpkg -i google-chrome-stable_current_amd64.deb
#sudo apt-get install -f

echo "Install Brave"
# sudo apt install apt-transport-https curl

# curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -

# source /etc/os-release

# echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/brave-browser-release-${UBUNTU_CODENAME}.list

# sudo apt update

# sudo apt install brave-browser

echo "Install Rar"
#sudo apt-get install unrar

echo "Install Mocp"
#sudo apt-get install -y moc
#cd $HOME/.moc && touch config
#echo "Theme = darkdot_theme" >> config
# echo "OnSongChange="/home/zero/.moc/moc_notify.sh"" >> config
#sudo chmod 756 config && cd $HOME

echo "Install Pavucontrol"
#sudo apt-get install -y pavucontrol

echo "Install ZSH"

#sudo apt-get install -y zsh
#sudo -u $USERNAME sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
#sudo -u $USERNAME which zsh
#continued..

# mv zePool.zsh-theme .oh-my-zsh/themes

echo "Install Pip"
# sudo apt-get install -y python-pip

echo "Install Python Prerequisites"
# sudo apt install zlib1g-dev
# sudo apt-get install libffi-dev

echo "Install Virtualenv"

# sudo apt install virtualenv

echo "Install VirtualenvWrapper"
# pip install --user virtualenvwrapper

echo "Install Powerline Fonts"
# sudo -u $USERNAME pip install git+git://github.com/Lokaltog/powerline
# wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
# sudo mv PowerlineSymbols.otf /usr/share/fonts/
# sudo fc-cache -vf
# sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/

echo "Install Tmux"
# sudo apt-get install -y tmux
#continued...

echo "Install Tree"
# sudo apt-get install -y tree

echo "Isntall Samba"
# sudo apt install samba

echo "Install Sqliteman"
# sudo apt-get install sqliteman

echo "Install Checkinstall"
# sudo apt-get install checkinstall

echo "Install Curl"
# sudo apt-get install curl

echo "Install Vim"
# sudo apt install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
# libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
# libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
# python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev 

# sudo apt remove -y vim vim-runtime gvim
# sudo apt remove -y vim-tiny vim-common vim-gui-common vim-nox
# git clone https://github.com/vim/vim.git vim-build
# cd $HOME/vim-build 

# ./configure --with-features=huge \
#             --enable-multibyte \
# 	    --enable-rubyinterp=yes \
# 	    --enable-pythoninterp=yes \
# 	    --with-python-config-dir=/usr/lib/python2.7/config \ # pay attention here check directory correct
# 	    --enable-python3interp=yes \
# 	    --with-python3-config-dir=/usr/lib/python3.5/config \
# 	    --enable-perlinterp=yes \
# 	    --enable-luainterp=yes \
#            --enable-gui=gtk2 \
#             --enable-cscope \
# 	   --prefix=/usr/local

# make VIMRUNTIMEDIR=/usr/local/share/vim/vim81
# sudo checkinstall  && cd $HOME

echo "Install Bundle"
# mkdir -p .vim/bundle && cd .vim/bundle #don't
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Install SimpleRecoder"
# sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder
# sudo apt-get update
# sudo apt-get install simplescreenrecorder

echo "Install Xcursor"
# sudo apt-get install xcursor-themes lxappearance

echo "Install Imaging"
# sudo apt-get install imagemagick
# sudo apt-get install python-imaging

echo "Install Conky"
# sudo apt install conky-all

echo "Install Ffmpeg"
# sudo apt-get install ffmpeg
