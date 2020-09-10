#!/bin/bash
echo ******************************************************************
echo  WSL INSTALL SCRIPTS
echo ******************************************************************
echo ""
echo ""
echo ""
echo ******************************************************************
echo  lsb data
echo ******************************************************************
echo ""
cat /etc/lsb-release 
echo ""
echo ""
echo ""
echo ******************************************************************







discode=$(grep DISTRIB_CODENAME  /etc/lsb-release  |  cut -d'=' -f2)


echo ******************************************************************
echo  BACKUP SOURCES.LIST
echo ******************************************************************

cp /etc/apt/sources.list /etc/apt/sources.list$SECONDS 2>/dev/null


echo ******************************************************************
echo  ADD REPO KEY
echo ******************************************************************

wget http://www.webmin.com/jcameron-key.asc 2>/dev/null
apt-key add jcameron-key.asc 2>/dev/null


echo ******************************************************************
echo  UPDATE  SOURCES.LIST
echo ******************************************************************



cat << EOF > /etc/apt/sources.list

deb http://us.archive.ubuntu.com/ubuntu/ $discode main restricted multiverse universe
deb http://security.ubuntu.com/ubuntu $discode-security main restricted multiverse universe
deb http://us.archive.ubuntu.com/ubuntu/ $discode-backports main restricted universe multiverse
deb http://us.archive.ubuntu.com/ubuntu/ $discode-updates main restricted multiverse universe
#
deb http://archive.canonical.com/ubuntu $discode partner
#
deb http://download.webmin.com/download/repository sarge contrib

 
EOF



echo ******************************************************************
echo  CREATE WSL.COMF
echo ******************************************************************


cat > /etc/wsl.conf << EOF

#Let’s enable extra metadata options by default
[automount]
enabled = true
#root = /mnt/
options = "metadata,umask=22,fmask=11"
mountFsTab = false

#Let’s enable DNS – even though these are turned on by default, we’ll specify here just to be explicit.
[network]
generateHosts = true
generateResolvConf = true
[interop]
appendWindowsPath = true
[user]
root

EOF

echo ******************************************************************
echo  UPDATE  APT REPO
echo ******************************************************************

apt-get update -y 2>/dev/null

echo ******************************************************************
echo  UPDATE  PKG
echo ******************************************************************


apt-get upgrade -y 2>/dev/null 

echo ******************************************************************
echo  INSTALL BASE PKG
echo ""
echo echo  apt-utils apt-transport-https 
echo wget curl
echo git
echo mc
echo net-tools
echo p7zip-full
echo unzip htop 
echo ******************************************************************

apt-get -y install apt-utils apt-transport-https wget curl git mc net-tools  p7zip-full unzip htop 2>/dev/null


sudo apt update && sudo apt upgrade -y

# Install basic packages
sudo apt -y install software-properties-common 
sudo apt -y install build-essential 
sudo apt -y install zip unzip 
sudo apt -y install make 
sudo apt -y install libssl-dev 
sudo apt -y install zlib1g-dev 
sudo apt -y install libbz2-dev 
sudo apt -y install libreadline-dev 
sudo apt -y install libsqlite3-dev 
sudo apt -y install wget 
sudo apt -y install curl 
sudo apt -y install llvm 
sudo apt -y install libncurses5-dev 
sudo apt -y install libncursesw5-dev 
sudo apt -y install xz-utils 
sudo apt -y install tk-dev 
sudo apt -y install libffi-dev 
sudo apt -y install liblzma-dev 
sudo apt -y install python-openssl 
sudo apt -y install git
sudo apt -y install apt-utils
sudo apt -y install apt-transport-https
sudo apt -y install mc
sudo apt -y install net-tools
sudo apt -y install p7zip-full
sudo apt -y install unzip
sudo apt -y install htop 
sudo apt -y install apt-config-icons-large 
sudo apt -y install apt-file 
sudo apt -y install apt-listchanges 
sudo apt -y install apt-show-versions 
sudo apt -y install apt-transport-https 
sudo apt -y install apt-utils 
sudo apt -y install openssh-server 
sudo apt -y install autoconf 
sudo apt -y install binutils 
sudo apt -y install coreutils 
sudo apt -y install dirmngr 
sudo apt -y install elinks 
sudo apt -y install elinks-data 
sudo apt -y install g++ 
sudo apt -y install g++-8 
sudo apt -y install gcc 
sudo apt -y install gcc-8 
sudo apt -y install gcc-8-base 
sudo apt -y install git-extras 
sudo apt -y install git-man 
sudo apt -y install gpg 
sudo apt -y install gzip 
sudo apt -y install hostname 
sudo apt -y install html2text 
sudo apt -y install links 
sudo apt -y install links2 
sudo apt -y install lsof 
sudo apt -y install lynx 
sudo apt -y install lynx-common 
sudo apt -y install ncurses-base 
sudo apt -y install ncurses-bin 
sudo apt -y install ncurses-term 
sudo apt -y install nmap 
sudo apt -y install sshfs 
sudo apt -y install ssl-cert 
sudo apt -y install strace 
sudo apt -y install telnet 
sudo apt -y install traceroute 
sudo apt -y install tree 
sudo apt -y install unar 

sudo apt install xrdp
sudo apt install -y xfce4
#scegliere gdm3
sudo apt install -y xfce4-goodies


sudo cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak
sudo sed -i 's/3389/3390/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/max_bpp=32/#max_bpp=32\nmax_bpp=128/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/xserverbpp=24/#xserverbpp=24\nxserverbpp=128/g' /etc/xrdp/xrdp.ini
echo xfce-session > ~/.xsession


sudo sed  -i 's/test -x \/etc\/X11\/Xsession && exec \/etc\/X11\/Xsession/#test -x \/etc\/X11\/Xsession && exec \/etc\/X11\/Xsession/g' /etc/xrdp/startwm.sh
sudo sed  -i 's/exec \/bin\/sh \/etc\/X11\/Xsession/#exec \/bin\/sh \/etc\/X11\/Xsession/g'  /etc/xrdp/startwm.sh

echo "# xfce" >> /etc/xrdp/startwm.sh
echo startxfce4 >> /etc/xrdp/startwm.sh





install_python3_pip() {
  sudo apt install -y python3-pip
}

install_miniconda() {
  mkdir -p ~/miniconda3
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
  bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
  rm -rf ~/miniconda3/miniconda.sh
  ~/miniconda3/bin/conda init bash
  ~/miniconda3/bin/conda config --set auto_activate_base false
}

install_python_conda_packages() {
  ~/miniconda3/bin/conda install -y -c conda-forge \
    jupyterlab \
    notebook \
    voila \
    pandas \
    ipython
}

install_php7() {
  sudo apt install -y \
    openssl \
    php-cli \
    php7.4 \
    php7.4-{common,bz2,imap,intl,bcmath,json,mbstring,soap,sybase,xsl,zip}
}

install_composer() {
  curl -sS https://getcomposer.org/installer -o composer-setup.php
  HASH=`curl -sS https://composer.github.io/installer.sig`
  php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
  sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
  
  rm -f composer-setup.php
}

install_nvm() {
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
  command -v nvm
}

export_nvm_dir() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

install_nodejs_12_lts() {
  export_nvm_dir
  nvm install v12
}

install_yarn() {
  npm i -g yarn
  yarn --version
}

install_java_jre() {
  sudo apt install -y default-jre
  java -version
}

install_java_jdk() {
  sudo apt install -y default-jdk
  javac -version

  echo 'JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"' >> ~/.bashrc
  source ~/.bashrc
}

export_sdkman_init() {
  source "$HOME/.sdkman/bin/sdkman-init.sh"
}

install_sdkman() {
  curl -s "https://get.sdkman.io" | bash
  export_sdkman_init
  sdk version
}

install_gradle() {
  export_sdkman_init

  sdk install gradle >=6
  gradle --version
}

install_dotnet_sdk() {
  wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
  sudo dpkg -i packages-microsoft-prod.deb

  sudo apt-get update; \
    sudo apt-get install -y apt-transport-https && \
    sudo apt-get update && \
    sudo apt-get install -y dotnet-sdk-3.1

  rm -f packages-microsoft-prod.deb
}

install_dotnet_runtime() {
  sudo apt-get install -y dotnet-runtime-3.1
}

mkdir -p Ubuntu-20.04-BasicSetup

echo "Installing Miniconda3 Package Tool..."
install_miniconda > Ubuntu-20.04-BasicSetup/miniconda_install.log

echo "Installing Python Common Packages..."
install_python_conda_packages > Ubuntu-20.04-BasicSetup/python_conda_packages_install.log

echo "Installing PHP 7..."
install_php7 > Ubuntu-20.04-BasicSetup/php7_install.log

echo "Installing Composer Package Tool..."
install_composer > Ubuntu-20.04-BasicSetup/composer_install.log

echo "Installing NVM (NodeJS Version Manager)..."
install_nvm > Ubuntu-20.04-BasicSetup/nvm_install.log

echo "Installing NodeJS v12 LTS..."
install_nodejs_12_lts > Ubuntu-20.04-BasicSetup/nodejs12_lts_install.log

echo "Installing Yarn..."
install_yarn > Ubuntu-20.04-BasicSetup/yarn_install.log

echo "Installing Java JRE..."
install_java_jre > Ubuntu-20.04-BasicSetup/java_jre_install.log

echo "Installing Java JDK..."
install_java_jdk > Ubuntu-20.04-BasicSetup/java_jdk_install.log

echo "Installing SDKMAN..."
install_sdkman > Ubuntu-20.04-BasicSetup/sdkman_install.log

echo "Installing Gradle..."
install_gradle > Ubuntu-20.04-BasicSetup/gradle_install.log

echo "Installing .NET Core 3.1 SDK..."
install_dotnet_sdk > Ubuntu-20.04-BasicSetup/dotnet_sdk_install.log

echo "Installing .NET Core 3.1 Runtime..."
install_dotnet_runtime > Ubuntu-20.04-BasicSetup/dotnet_runtime_install.log
