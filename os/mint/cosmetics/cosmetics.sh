#!/bin/bash

cfg_path=$(echo $(pwd))

################################################################################
#                                                                              #
################################################################################

# THEME MITHRAS
function func_mithras_theme()
{
	tar -xvzf ${cfg_path}/os/mint/cosmetics/themes/cinnamon/flat-dark-blue-v1.0.tar.gz -C ~/Desktop/ ;
	cp -rf ~/Desktop/flat-dark-blue ~/.themes ;
	gsettings set org.cinnamon.theme name 'flat-dark-blue' ;
	rm -rf ~/Desktop/flat-dark-blue ;
	return ;
}

################################################################################
# Menu settings                                                                #
################################################################################

theme_name_mithras="mithras"

menu_title="'Cosmetic configuration'"
menu_options="'mithras' 'theme'"

################################################################################
# Show the menu                                                                #
################################################################################

pwd_base=$(echo $(pwd))
pwd_base=${pwd_base}"/os/mint"
source ${pwd_base}/installer_config.sh
app_menu_choices=$(eval "$menu_template")

################################################################################
#                                                                              #
################################################################################

if grep -q "$theme_name_mithras" <<< "$app_menu_choices"; then
	func_mithras_theme
fi