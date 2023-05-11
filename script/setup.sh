#!/bin/sh

. "./config/constants.sh"
. "./helpers/zsh.sh"
. "./helpers/homebrew.sh"
. "./helpers/alacritty.sh"
. "./helpers/ssh.sh"
. "./helpers/asdf.sh"
. "./helpers/fzf.sh"
. "./helpers/vim.sh"
. "./helpers/tmux.sh"
. "./helpers/zoxide.sh"

setup_homebrew
setup_ssh_keys
setup_asdf
setup_fzf
setup_vim
setup_alacritty
setup_tmux
setup_zoxide
setup_zsh
