#!/bin/sh

. "./config/constants.sh"
. "./helpers/zsh.sh"
. "./helpers/homebrew.sh"
. "./helpers/alacritty.sh"
. "./helpers/ssh.sh"
. "./helpers/mise.sh"
. "./helpers/fzf.sh"
. "./helpers/nodejs.sh"
. "./helpers/tmux.sh"
. "./helpers/vscodium.sh"
. "./helpers/zoxide.sh"
. "./helpers/go.sh"
. "./helpers/eza.sh"
. "./helpers/delta.sh"

setup_homebrew
setup_ssh_keys
setup_mise
setup_fzf
setup_alacritty
setup_tmux
setup_zoxide
setup_zsh
setup_nodejs
setup_vscodium
setup_go
setup_eza
setup_delta
