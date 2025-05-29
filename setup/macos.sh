#!/bin/sh

## Helpers

setup_vim() {
	### Requires: GNU Stow, Homebrew

	### Install Vim
	brew install vim

	### Configure Vim
	stow vim --target="$HOME" --dir="../"
}

## Steps

setup_vim
