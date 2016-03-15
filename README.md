# initLinux v1.0
init a linux os with all thing needed by a web developer.

It was tested in :

- Debian
- Ubuntu
- LinuxMint

The script install :
- php5
- php5-cli
- php5-mysql (needed by symfony doctrine)
- npm
- git
- dpkg
- Java8
- software-center (to install .deb package)
- composer (global install)
- PhpStorm 10.0.3
- IntelliJ 15.0.4
- firefox (ubuntu)
- iceweasel (debian)
- gcc
- man

Those software are optional : 
- maven
- gitKraken
- gulp (global)
- atom
- terminator

Those one are separate because of their big weight :
- latex (full)
- texstudio

all file downloaded for installation are remove (if it's possible).

### main alias (in bashrc-min)

I put some alias what are very usefull :
- phpStorm
- intelliJ

### less usefull alias (in bashrc-full)

Those alias are more useless if you don't use some software :
- emptyHtdoc (what rm all file contains in /opt/lamp/htdoc). Useless if you don't use an apache server.

###contributor
- valentinCro
- Renan Decamps
