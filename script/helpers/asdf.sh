#!/bin/sh

setup_asdf() {
	# Add asdf config to `~/.zshrc`
	# `-e` flag for `echo` removed as it causes a bug
	echo "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
}
