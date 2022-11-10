#!/bin/bash

################################################################################
# Application installation commands                                            #
################################################################################

# BROWSER: BRAVE
app_cmd_brave="echo $PASSWORD | \
	sudo -Sk apt install -y apt-transport-https | \
	apt install -y curl gnupg ;  apt install -y gnupg ; \
	curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | \
	sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add - ; \
	'deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main' | \
	sudo tee /etc/apt/sources.list.d/brave-browser-release.list && sudo apt update -m ; \
	apt install -y brave-browser"

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

################################################################################
# Menu settings                                                                #
################################################################################

app_name_element="Element"
app_name_brave="Brave"

menu_title="selection"
menu_options="TRUE Brave TRUE Element"

################################################################################
# Show the menu                                                                #
################################################################################

pwd_base=$(echo $(pwd))
pwd_base=${pwd_base}"/os/mint"
source ${pwd_base}/installer_config.sh
app_menu_choices=$(eval "$menu_template")

################################################################################
# Install selected apps                                                        #
################################################################################

if grep -q "$app_name_element" <<< "$app_menu_choices"; then
	echo $app_cmd_element | bash
fi

if grep -q "$app_name_brave" <<< "$app_menu_choices"; then
	echo $app_cmd_brave | bash
fi
