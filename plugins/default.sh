read -p "Do you wish to install full alias (y/n) (invalid input equals yes) ? " choice

if [ -z $choice ]
then
	choice="y"
fi

if [ $choice == "n" ]
  then
	sudo mv bashrc-min ~/.bashrc
else
	sudo mv bashrc-full ~/.bashrc
fi

sudo apt-get --yes --force-yes install php5
sudo apt-get --yes --force-yes install php5-cli
sudo apt-get --yes --force-yes install php5-mysql
sudo apt-get --yes --force-yes install curl
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get --yes --force-yes install git
sudo apt-get --yes --force-yes install dpkg
sudo apt-get --yes --force-yes install gcc
sudo apt-get --yes --force-yes install man

distrib=$(lsb_release -i | cut -f 2- | tr '[:upper:]' '[:lower:]')

if [ $distrib == "debian" ]
then
	sudo apt-get --yes --force-yes install iceweasel
elif [ $distrib == "ubuntu" ] && [ $distrib == "linuxmint" ]
then	
	sudo apt-get --yes --force-yes install firefox
fi

#Install JAVA
sudo echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | sudo tee /etc/apt/sources.list.d/java-8-debian.list
sudo echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | sudo tee -a /etc/apt/sources.list.d/java-8-debian.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
sudo apt-get update
sudo apt-get --yes --force-yes install oracle-java8-installer
sudo apt-get --yes --force-yes install oracle-java8-set-default

#install composer
cd ~/
php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
php -r "if (hash('SHA384', file_get_contents('composer-setup.php')) === '41e71d86b40f28e771d4bb662b997f79625196afcca95a5abf44391188c695c6c1456e16154c75a211d238cc3bc5cb47') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer
#install phpStorm
cd ~/
wget -c "https://download.jetbrains.com/webide/PhpStorm-10.0.3.tar.gz"
tar -xvf PhpStorm-10.0.3.tar.gz
rm PhpStorm-*.tar.gz
mv PhpStorm-* ~/phpStorm

#install intelliJ
cd ~/
wget -c "https://download.jetbrains.com/idea/ideaIU-15.0.4.tar.gz"
tar -xvf ideaIU-15.0.4.tar.gz
rm ideaIU-*.tar.gz
mv idea-IU-* ~/ideaIU

read -p "Do you wish to install optional software (y/n) (invalid input equals yes) ? " choice

if [ -z $choice ]	
then
	choice="y"
fi	

if [ $choice == "n" ]
  then
	echo "Well, no problem... *cry*"
else
	sudo apt-get --yes --force-yes install maven
	sudo apt-get --yes --force-yes install terminator

	#install gitKraken
	cd ~/
	wget -c "https://release.gitkraken.com/linux/gitkraken-amd64.deb"
	sudo dpkg -i gitkraken-amd64.deb
	rm gitkraken-amd64.deb

	#install atom
	cd ~/
	wget -c "https://atom.io/download/deb"
	mv deb atom-amd64.deb
	sudo dpkg -i atom-amd64.deb
	rm atom-amd64.deb
fi

read -p "Do you wish to install latex and texstudio (y/n) (invalid input equals yes) ? " choice

if [ -z $choice ]	
then
	choice="y"
fi	

if [ $choice == "n" ]
  then
	echo "Well, no problem... *cry*"
else
	sudo apt-get --yes --force-yes install texlive-full
	sudo apt-get --yes --force-yes install texstudio
fi

#install gulp
sudo npm install -g gulp
