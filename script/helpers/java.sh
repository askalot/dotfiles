#!/bin/sh

setup_java() {
	asdf plugin add java https://github.com/asdf-vm/halcyon/asdf-java.git

	asdf install java "temurin-17.0.8+7"

	asdf global java "temurin-17.0.8+7"
}
