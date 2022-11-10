#!/bin/bash

PASSWORD=$(zenity --password)

app_cmd_brave="echo $PASSWORD | \
	sudo -Sk apt install -y apt-transport-https | \
	apt install -y curl gnupg ;  apt install -y gnupg ; \
	curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | \
	sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add - ; \
	'deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main' | \
	sudo tee /etc/apt/sources.list.d/brave-browser-release.list && sudo apt update -m ; \
	apt install -y brave-browser"

app_cmd_element="echo $PASSWORD | \
	sudo apt install -y wget apt-transport-https -y | \
	sudo wget -O /usr/share/keyrings/element-io-archive-keyring.gpg https://packages.element.io/debian/element-io-archive-keyring.gpg | \
	echo 'deb [signed-by=/usr/share/keyrings/element-io-archive-keyring.gpg] https://packages.element.io/debian/ default main' | \
	sudo tee /etc/apt/sources.list.d/element-io.list | \
	sudo apt update | \
	sudo apt install element-desktop -y"

app_choice=$(zenity --list --width=500 --height=250 --window-icon=question --checklist \
	--title="Software selection" --column="Pick" --column="Choices" \
	TRUE Brave \
	TRUE Element \
	--separator=",")

app_name_element="Element"
app_name_brave="Brave"

if grep -q "$app_name_element" <<< "$app_choice"; then
	echo $app_cmd_element | bash
fi

if grep -q "$app_name_brave" <<< "$app_choice"; then
	echo $app_cmd_brave | bash
fi
