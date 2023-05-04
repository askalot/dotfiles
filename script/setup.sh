#!/bin/sh

. "./config/constants.sh"
. "./helpers/homebrew.sh"
. "./helpers/ssh.sh"
. "./helpers/asdf.sh"
. "./helpers/vim.sh"

setup_homebrew
setup_ssh_keys
setup_asdf
setup_vim
