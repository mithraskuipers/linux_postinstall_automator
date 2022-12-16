#!/bin/bash

cfg_path=$(echo $(pwd))

################################################################################
# Application installation commands                                            #
################################################################################

# YTDLP
function func_cfg_ytdlp()
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
	sed -i '/ yt=/d' ~/.bashrc ;
	sed -i '/ yta=/d' ~/.bashrc ;
	sed -i '/ ytc=/d' ~/.bashrc ;
	echo 'alias yt="yt-dlp"' >> ~/.bashrc ;
	echo 'alias yta="yt-dlp --config-location ~/.config/yt-dlp/config_audio"' >> ~/.bashrc ;
	echo 'alias ytc="yt-dlp --config-location ~/.config/yt-dlp/config_comments"' >> ~/.bashrc ;
    echo 'alias ytl=alias ytl="ls | awk -F"]" '{print $1}' | awk -F"[" '{print $NF}' > archive_list_new.txt"' >> archive_list_new.txt
	return ;
}

# GIT
function func_cfg_git()
{
	echo "Running func_cfg_git()" ;
	sed -i '/ gac=/d' ~/.bashrc ;
	sed -i '/ gp=/d' ~/.bashrc ;
	sed -i '/ gpf=/d' ~/.bashrc ;
	sed -i '/ gpb=/d' ~/.bashrc ;
	sed -i '/ gc=/d' ~/.bashrc ;
	sed -i '/ gm=/d' ~/.bashrc ;
	sed -i '/ gb=/d' ~/.bashrc ;
	echo 'alias gac="git add . && git commit -m"' >> ~/.bashrc ;
	echo 'alias gp="git push"' >> ~/.bashrc ;
	echo 'alias gpf="git push -f origin master"' >> ~/.bashrc ;
	echo 'alias gpb="git push --set-upstream origin"' >> ~/.bashrc ;
	echo 'alias gm="git merge"' >> ~/.bashrc ;
	echo 'alias gb="git branch"' >> ~/.bashrc ;
	echo 'alias gck="git checkout"' >> ~/.bashrc ;
	echo 'alias gckm="git checkout master"' >> ~/.bashrc ;
	return ;
}

# QBITTORRENT
function func_cfg_qbittorrent()
{
	cfg_path_qbittorrent=${cfg_path}/os/shared/qbittorrent ;
    cfg_path_qbittorrent_source=${cfg_path_qbittorrent}/qBittorrent.conf ;
	cfg_path_qbittorrent_destination=$(echo ~/.config/qBittorrent) ;
    mkdir -p $cfg_path_qbittorrent_destination ;
    cp $cfg_path_qbittorrent_source $cfg_path_qbittorrent_destination ;
	return ;
}

function func_cfg_spyder()
{
	conda install spyder-terminal -c spyder-ide ;
	cfg_path_spyder=${cfg_path}/os/shared/spyder ;
	cfg_path_spyder_source=${cfg_path_spyder}/spyder.ini ;
	cfg_path_spyder_destination=$(echo ~/.config/spyder-py3/config) ;
	cp $cfg_path_spyder_source $cfg_path_spyder_destination ;
	return ;
}

function func_cfg_keybindings()
{
	cfg_path_keybindings=${cfg_path}/os/mint/settings ;
	cfg_path_keybindings_dconf=${cfg_path_keybindings}/dconf-settings_keybindings.conf ;
    dconf load /org/cinnamon/desktop/keybindings/ < ${cfg_path_keybindings_dconf}
	return ;
}

################################################################################
# Menu settings                                                                #
################################################################################

menu_title="'Auto configuration'"
menu_options="'ytdlp' 'config + alias' \
'git' 'alias' \
'qbittorrent' 'upload 10kbps; autom. torrent removal when finished' \
'spyder' 'config' \
'keybindings' 'dconf' \
"

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

if grep -q "ytdlp" <<< "$app_menu_choices"; then
	func_cfg_ytdlp
fi

if grep -q "git" <<< "$app_menu_choices"; then
	func_cfg_git ;
fi

if grep -q "qbittorrent" <<< "$app_menu_choices"; then
	func_cfg_qbittorrent
fi

if grep -q "spyder" <<< "$app_menu_choices"; then
	func_cfg_spyder
fi

if grep -q "keybindings" <<< "$app_menu_choices"; then
	func_cfg_keybindings
fi
