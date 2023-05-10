#!/bin/sh

ZSHRC=${ZDOTDIR:-~}/.zshrc

setup_zsh() {
	cp "../.zshrc" "$ZSHRC"
}
