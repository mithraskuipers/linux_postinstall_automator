#!/bin/bash

cfg_path=$(echo $(pwd))


################################################################################
# Application installation commands                                            #
################################################################################

# YTDLP
func_cfg_ytdlp()
{
	cfg_path_ytdlp_destination=$(echo ~/.config/yt-dlp) ;
	mkdir -p $cfg_path_ytdlp_destination ;
	cfg_path_ytdlp=${cfg_path}/os/shared/yt-dlp ;
	cfg_path_ytdlp_source=${cfg_path_ytdlp}/configs ;
	cfg_path_ytdlp_source_config=${cfg_path_ytdlp_source}/config ;
	cfg_path_ytdlp_source_config_comments=${cfg_path_ytdlp_source}/config_comments ;
	cfg_path_ytdlp_source_config_audio=${cfg_path_ytdlp_source}/config_audio ;
	cp $cfg_path_ytdlp_source_config $cfg_path_ytdlp_destination ;
	cp $cfg_path_ytdlp_source_config_comments $cfg_path_ytdlp_destination ;
	cp $cfg_path_ytdlp_source_config_audio $cfg_path_ytdlp_destination ;
	echo 'alias yt="yt-dlp"' >> ~/.bashrc ;
	echo 'alias yta="yt-dlp --config-location ~/.config/yt-dlp/config_audio"' >> ~/.bashrc ;
	echo 'alias ytc="yt-dlp --config-location ~/.config/yt-dlp/config_comments"' >> ~/.bashrc
}

# GIT
func_cfg_git()
{
	echo 'alias gac="git add . && git commit -m"' >> ~/.bashrc ;
	echo 'alias gp="git push"' >> ~/.bashrc ;
	echo 'alias gpf="git push -f origin master"' >> ~/.bashrc ;
	echo 'alias gpb="git push --set-upstream origin"' >> ~/.bashrc ;
	echo 'alias gc="git checkout"' >> ~/.bashrc ;
	echo 'alias gm="git merge"' >> ~/.bashrc ;
	echo 'alias gb="git branch' >> ~/.bashrc ;
}

################################################################################
# Menu settings                                                                #
################################################################################

app_name_ytdlp="ytdlp"
menu_title="Select\ software\ to\ automatically\ configure"
menu_options="ytdlp git"

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

if grep -q "$app_name_ytdlp" <<< "$app_menu_choices"; then
	func_cfg_ytdlp
fi

if grep -q "$app_name_git" <<< "$app_menu_choices"; then
	func_cfg_git
fi
