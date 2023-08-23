#!/bin/sh

setup_go() {
	asdf plugin add golang https://github.com/asdf-community/asdf-golang.git

	asdf install golang 1.21.0

	asdf global golang 1.21.0
}
