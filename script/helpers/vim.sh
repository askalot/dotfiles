#!/bin/sh

setup_vim() {
	# Install vim-plug
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	# Copy config template to config directory
	cp "../vim/.vimrc" "$HOME/.vimrc"

	# Install Vim plugins
	vim +'PlugInstall --sync' +qa
}
