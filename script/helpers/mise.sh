#!/bin/sh

setup_mise() {
	# Add mise config to `~/.zshrc`
	# shellcheck disable=SC2016
	echo 'eval "$(mise activate zsh)"' >> "${ZDOTDIR-$HOME}/.zshrc"
}
