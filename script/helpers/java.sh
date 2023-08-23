#!/bin/sh

setup_java() {
	asdf plugin add java https://github.com/halcyon/asdf-java.git

	asdf install java "temurin-17.0.8+7"

	asdf global java "temurin-17.0.8+7"
}
