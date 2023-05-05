#!/bin/sh

. "./config/constants.sh"
. "./helpers/homebrew.sh"
. "./helpers/alacritty.sh"
. "./helpers/ssh.sh"
. "./helpers/asdf.sh"
. "./helpers/vim.sh"
. "./helpers/tmux.sh"

setup_homebrew
setup_ssh_keys
setup_asdf
setup_vim
setup_alacritty
setup_tmux
