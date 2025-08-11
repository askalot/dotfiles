#!/bin/sh

# Config

## Exit immediately if a command exits with non-zero status
set -e

CONFIG_DIRECTORY="$(pwd)/config/ubuntu"

# Helpers

## Format text

color_blue() {
	printf "\033[94m%s\033[0m" "$1"
}

color_green() {
	printf "\033[32m%s\033[0m" "$1"
}

color_magenta() {
	printf "\033[35m%s\033[0m" "$1"
}

color_orange() {
	printf "\033[33m%s\033[0m" "$1"
}

icon_green_tick=$(color_green "✓")

print_todo() {
	printf "[ ] %s..." "$1"
}

print_done() {
	printf "\r[%s] %s   \n" "$icon_green_tick" "$1"
}

## apt

install_apt_package() {
	message_install_apt_package="$(color_blue 'Install') $1"
	print_todo "$message_install_apt_package"
	sudo apt-get install -y "$1" > /dev/null
	print_done "$message_install_apt_package"
}

update_apt() {
	message_update_apt="$(color_orange 'Update') apt"
	print_todo "$message_update_apt"
	sudo apt-get update > /dev/null
	print_done "$message_update_apt"
}

upgrade_apt() {
	message_upgrade_apt="$(color_orange 'Upgrade') apt"
	print_todo "$message_upgrade_apt"
	sudo apt-get upgrade -y > /dev/null
	print_done "$message_upgrade_apt"
}

## gnome-extensions

install_gnome_extension() {
	message_install_gnome_extension="$(color_blue 'Install') $1"
	print_todo "$message_install_gnome_extension"
	gext install "$1"
	print_done "$message_install_gnome_extension"
}

install_gnome_extensions_cli() {
	message_install_gnome_extensions_cli="$(color_blue 'Install') gnome-extensions-cli"
	print_todo "$message_install_gnome_extensions_cli"
	pipx install gnome-extensions-cli --system-site-packages > /dev/null
	pipx ensurepath --force > /dev/null
	print_done "$message_install_gnome_extensions_cli"
}

## lazygit

install_lazygit() {
	message_install_lazygit="$(color_blue 'Install') lazygit"
	print_todo "$message_install_lazygit"
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*' 2>/dev/null)
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" >/dev/null 2>&1
	tar xf lazygit.tar.gz lazygit >/dev/null 2>&1
	sudo install lazygit /usr/local/bin >/dev/null 2>&1
	print_done "$message_install_lazygit"
}

## shell

reload_shell() {
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
		print_done "Reload shell"
	fi
}

## stow

stow_config() {
	message_stow_config="$(color_magenta 'Config') $1"
	print_todo "$message_stow_config"
	cd "$CONFIG_DIRECTORY" > /dev/null
	stow -t "$HOME" "$1"
	cd - > /dev/null
	print_done "$message_stow_config"
}

# Setup

#update_apt

install_apt_package "curl"
install_apt_package "git"
install_apt_package "stow"
install_apt_package "unzip"
install_apt_package "gnome-shell-extension-manager"
install_apt_package "pipx"
install_gnome_extensions_cli
reload_shell
install_lazygit

## alacritty
install_apt_package "alacritty"
stow_config "alacritty"

## spacebar
install_gnome_extension "space-bar@luchrioh"

# Upgrade everything that might ask for a reboot last
upgrade_apt

## gum

#install_gum() {
	#sudo mkdir -p /etc/apt/keyrings
	#curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
	#echo "deb [signed=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
	#update_apt
	#install_apt_package "gum"
#}
#install_gum

## workspaces

workspace_config() {
	message_workspace_config="$(color_magenta 'Config') GNOME workspaces"
	print_todo "$message_workspace_config"

	# 6 fixed workspaces
	gsettings set org.gnome.mutter dynamic-workspaces false
	gsettings set org.gnome.desktop.wm.preferences num-workspaces 6

	# <Super> + [1-6] to switch workspace
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Super>5']"
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Super>6']"

	print_done "$message_workspace_config"
}
workspace_config
