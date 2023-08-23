#!/bin/sh

. "./config/constants.sh"
. "./helpers/zsh.sh"
. "./helpers/homebrew.sh"
. "./helpers/alacritty.sh"
. "./helpers/ssh.sh"
. "./helpers/asdf.sh"
. "./helpers/fzf.sh"
. "./helpers/nodejs.sh"
. "./helpers/vim.sh"
. "./helpers/tmux.sh"
. "./helpers/vscodium.sh"
. "./helpers/zoxide.sh"
. "./helpers/java.sh"
. "./helpers/go.sh"

setup_homebrew
setup_ssh_keys
setup_asdf
setup_fzf
setup_vim
setup_alacritty
setup_tmux
setup_zoxide
setup_zsh
setup_nodejs
setup_vscodium
setup_java
setup_go
