#!/bin/sh

ZSHRC=${ZDOTDIR:-~}/.zshrc

append_to_zshrc() {
	#LINE_TO_APPEND=$1

	touch "$ZSHRC"

	echo "$1"

	printf "\\n%s" "$1" >> "$ZSHRC"
}

setup_zsh() {
	cp "../.zshrc" "$ZSHRC"
}
