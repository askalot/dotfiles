#!/bin/sh

. "./config/constants.sh"
. "./helpers/homebrew.sh"
. "./helpers/ssh.sh"
. "./helpers/asdf.sh"

setup_homebrew
setup_ssh_keys
setup_asdf
