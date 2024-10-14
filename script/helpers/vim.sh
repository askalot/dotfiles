#!/bin/sh

setup_vim() {
	# Install vim-plug
	curl -fLo "$HOME/.config/vim/autoload/plug.vim" --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	# Link Vim config
	stow vim --target="$HOME" --dir "../"

	# Install Vim plugins
	vim +'PlugInstall --sync' +qa
}
