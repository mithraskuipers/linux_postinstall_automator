#!/bin/bash

################################################################################
# Menu settings                                                                #
################################################################################

menu_title="Install"

menu_options="'Brave' 'browser'\
			'clang' 'engineering'\
			'Element' 'messenger'\
			'GCC' 'engineering'\
			'gedit' 'text editor'\
			'Git' 'engineering'\
			'lutris' 'gaming'\
			'Make' 'engineering'\
			'wine64' 'gaming'\
			'ytdlp' 'YouTube download tool'\
			'qbittorrent' 'download tool'\
			'xtrlock' 'keyboard lock'\
			'xbindkeys' 'custom keyboard shortcuts'\
			'vscode' 'engineering'\
			'zandronum' 'gaming'\
            'rpiimager' 'imager'\
			"

################################################################################
# Show the menu                                                                #
################################################################################

pwd_base=$(echo $(pwd))
pwd_base=${pwd_base}"/os/ubuntu"
source ${pwd_base}/installer_config.sh
app_menu_choices=$(eval "$menu_template")

################################################################################
# Application installation commands                                            #
################################################################################

# BROWSER: BRAVE
func_install_brave()
{
	echo $PASSWORD | udo apt install apt-transport-https curl ;
	echo $PASSWORD | sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg ;
	echo $PASSWORD | echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list ;
	echo $PASSWORD | sudo apt update ;
	echo $PASSWORD | sudo apt install brave-browser ;
	return ;
}

# MESSENGER: ELEMENT
app_cmd_element="echo $PASSWORD | \
	sudo apt install -y wget apt-transport-https -y | \
	sudo wget -O /usr/share/keyrings/element-io-archive-keyring.gpg \
	https://packages.element.io/debian/element-io-archive-keyring.gpg | \
	echo 'deb [signed-by=/usr/share/keyrings/element-io-archive-keyring.gpg]\
	https://packages.element.io/debian/ default main' | \
	sudo tee /etc/apt/sources.list.d/element-io.list | \
	sudo apt update | \
	sudo apt install element-desktop -y"

# GIT
app_cmd_git="echo $PASSWORD | \
	sudo apt install git -y"

# MAKE
app_cmd_make="echo $PASSWORD | \
	sudo apt install make -y"

# GCC
app_cmd_gcc="echo $PASSWORD | \
	sudo apt install gcc -y"

# CLANG
app_cmd_clang="echo $PASSWORD | \
	sudo apt install clang -y"

# GEDIT
app_cmd_clang="echo $PASSWORD | \
	sudo apt install gedit -y"

# YTDLP
app_cmd_ytdlp="echo $PASSWORD | \
	sudo apt install yt-dlp -y ;
	sudo apt-get install aria2 -y"

# WINE64
app_cmd_wine64="echo $PASSWORD | \
	sudo apt install wine64 -y"

# LUTRIS
app_cmd_lutris="echo $PASSWORD | \
	sudo apt install lutris -y"

# QBITTORRENT
func_install_qbittorrent()
{
	echo $PASSWORD | sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable ;
	echo $PASSWORD | sudo apt-get update ;
	echo $PASSWORD | sudo apt-get install qbittorrent ;
}

# XTRLOCK
func_install_xtrlock()
{
	echo $PASSWORD | sudo apt-get install xtrlock ;
}

func_install_xbindkeys()
{
	echo $PASSWORD | sudo apt-get install xbindkeys ;
}

func_install_vscode()
{
	echo $PASSWORD | sudo apt-get install wget gpg ;
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg ;
	echo $PASSWORD | sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg ;
	echo $PASSWORD | sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list' ;
	rm -f packages.microsoft.gpg ;
	echo $PASSWORD | sudo apt install apt-transport-https ;
	echo $PASSWORD | sudo apt update ;
	echo $PASSWORD | sudo apt install code ;
}

func_install_zandronum()
{
	wget -O - http://debian.drdteam.org/drdteam.gpg | sudo apt-key add - ;
	echo $PASSWORD | sudo add-apt-repository 'deb http://debian.drdteam.org/ stable multiverse' ;
	echo $PASSWORD | sudo apt-get update ;
	echo $PASSWORD | sudo apt-get install zandronum doomseeker-zandronum ;
}

func_install_rpiimager()
{
    echo $PASSWORD | sudo apt install rpi-imager -y;
}

################################################################################
# Install selected apps                                                        #
################################################################################

if grep -q "brave" <<< "$app_menu_choices"; then
	func_install_brave
fi

if grep -q "element" <<< "$app_menu_choices"; then
	echo $app_cmd_element | bash
fi

if grep -q "git" <<< "$app_menu_choices"; then
	echo $app_cmd_git | bash
fi

if grep -q "make" <<< "$app_menu_choices"; then
	echo $app_cmd_make | bash
fi

if grep -q "gcc" <<< "$app_menu_choices"; then
	echo $app_cmd_gcc | bash
fi

if grep -q "clang" <<< "$app_menu_choices"; then
	echo $app_cmd_clang | bash
fi

if grep -q "gedit" <<< "$app_menu_choices"; then
	echo $app_cmd_gedit | bash
fi

if grep -q "ytdlp" <<< "$app_menu_choices"; then
	echo $app_cmd_ytdlp | bash
fi

if grep -q "wine64" <<< "$app_menu_choices"; then
	echo $app_cmd_wine64 | bash
fi

if grep -q "lutris" <<< "$app_menu_choices"; then
	echo $app_cmd_lutris | bash
fi

if grep -q "qbittorrent" <<< "$app_menu_choices"; then
	func_install_qbittorrent
fi

if grep -q "xtrlock" <<< "$app_menu_choices"; then
	func_install_xtrlock
fi

if grep -q "xbindkeys" <<< "$app_menu_choices"; then
	func_install_xbindkeys
fi

if grep -q "vscode" <<< "$app_menu_choices"; then
	func_install_vscode
fi

if grep -q "anaconda" <<< "$app_menu_choices"; then
	func_install_anaconda
fi

if grep -q "zandronum" <<< "$app_menu_choices"; then
	func_install_zandronum
fi

if grep -q "rpiimager" <<< "$app_menu_choices"; then
    func_install_rpiimager
fi
